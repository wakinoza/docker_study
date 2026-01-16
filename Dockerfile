# --- リファクタリング後 ---
# --- ステージ1：ビルド用 ---
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

COPY Main.java .

# コンパイルを実行
RUN javac Main.java


# --- ステージ2：実行用 ---
# 実行には JDK ではなく、より軽量な JRE を使用
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# セキュリティのため、実行用のユーザーを作成
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# ビルドステージからコンパイル済みの .class ファイルだけをコピー
COPY --from=builder /app/Main.class .

# 実行コマンド
CMD ["java", "Main"]