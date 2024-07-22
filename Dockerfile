FROM nixos/nix:2.21.4

WORKDIR /app
COPY . .
RUN mkdir -p /etc/nix && echo "experimental-features = nix-command flakes" > /etc/nix/nix.conf
RUN nix --version && nix flake show
CMD ["nix", "develop", ".#nevica-full"]
