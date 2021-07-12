Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB2B3C5F38
	for <lists+linux-next@lfdr.de>; Mon, 12 Jul 2021 17:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbhGLP1J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 11:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhGLP1J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 11:27:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C97AC0613DD;
        Mon, 12 Jul 2021 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=9ASsPr+pjYR53D1/AoGhlwY8k1l/VzUuijiRTftFV7w=; b=ZzzRSKp/VlK+dBsjrqY0K9K/PZ
        TONI+alu0F6DyX7Kef0QfqfrOisKru9+x49X0laUG7kY99alLkPBoTFWbFtRiQ9989vUdXkHfc599
        wEcM1gwM9kc2Ej3GtnSzptf51EL+/f6Zc/GyFKvwUrFuVsTV71w3hucbC7UMGKdr48kop+bawnQYf
        gSS6I/aBUX3dp7dbqVpC1+LyLZDS//5RVTYAm7K3Q+SC/Ki1A8M/ZNXnqUPXIutwpLckDeIn5CVg6
        wZ0ncrvGFbs3390oKduVGVZbea2BWjYxW9dJGKqEdQ9/M0FvcJyhMdy9nQg945YbNCSw1huhUNXHt
        IH1B0t+g==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m2xn9-007jK3-MS; Mon, 12 Jul 2021 15:24:19 +0000
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
Date:   Mon, 12 Jul 2021 08:24:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712120828.5c480cdc@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/11/21 7:08 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210709:
> 
> The rust tree gained a conflict against Linus' tree.
> 

I am getting no builds completing. I see this:

Error: No compiler specified.
Usage:
	../scripts/rust-version.sh <rust-command>
init/Kconfig:71: syntax error
init/Kconfig:70: invalid statement

and then 'bc' running continuously until I kill it.


Since I don't have any Rust compiler or tools installed,
this fixes the build problems for me for now:


---
 init/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210712.orig/init/Kconfig
+++ linux-next-20210712/init/Kconfig
@@ -62,12 +62,12 @@ config LLD_VERSION
 
 config HAS_RUST
 	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV
-	def_bool $(success,$(RUSTC) --version)
+	def_bool false
 
 config RUSTC_VERSION
 	depends on HAS_RUST
 	int
-	default $(shell,$(srctree)/scripts/rust-version.sh $(RUSTC))
+	default 0
 
 config CC_CAN_LINK
 	bool


