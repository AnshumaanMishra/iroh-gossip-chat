# iroh-gossip-chat

> Simple chat app in Rust using `iroh-gossip`  
> Reference: [iroh-gossip-chat](https://docs.iroh.computer/examples/chat#messages)

---

<a id="usage"></a>

## Usage

There are only two commands. To create a room, and join with username `user1` use

```shell
./iroh-gossip-chat --name user1 open
```

This will give you an output with a `<ticket>` as

```shell
> Opening Chat room for topic <topic_token>
> Endpoint ID: <endpoint_token>
> Ticket to join us: <ticket>
> Waiting for endpoints to join...
```

From the other terminal use 

```shell
cargo run -- --name user2 join <ticket>
```

You will join successfully. Then you can enter messages and they will be broadcasted.

---

<a id="building"></a>

## Building

### 1. Prerequisite

Clone the repo and enter the repository

```shell
git clone https://github.com/AnshumaanMishra/iroh-gossip-chat.git
cd iroh-gossip-chat
```

### 2. Dependencies

The repo comes with a `devenv.nix` file.
If you use [devenv](https://devenv.sh/), simply use

```shell
devenv inputs add rust-overlay github:oxalica/rust-overlay --follows nixpkgs
devenv shell
```

The repo also includes the corresponding `.envrc` file
So if you have [direnv](https://direnv.net/) set up, use

```shell
direnv allow
```

Else use any preferred way to install [Rust](https://rust-lang.org/tools/install/)

### 3. Installing Dependencies

The default `cargo` package manager is used. 
To just install all dependencies use
```shell
cargo fetch
```

Directly running will automatically do all the necessary steps. Simply use

```shell
cargo run -- <arguments>
```

See [Usage](#usage) for details

To build (Debug Mode)

```shell
cargo build
```

To build (Release Mode)

```shell
cargo build --release
```

### 4. Workflows

This part is optional, but you can refer to the [devenv.nix](./devenv.nix) for workflow scripts.
