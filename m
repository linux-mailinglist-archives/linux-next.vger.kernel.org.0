Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4E13E967D
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 19:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHKRFO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 13:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhHKRFO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2021 13:05:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE6DC0613D3
        for <linux-next@vger.kernel.org>; Wed, 11 Aug 2021 10:04:50 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id h9so5723246ljq.8
        for <linux-next@vger.kernel.org>; Wed, 11 Aug 2021 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knf4e9QJIMKImSV5qeMhnbOncjZp3zFKh9Lv4EXo6MI=;
        b=NgvSaEE+J2Qu7IXRxAXxxmGfKrrGRgvjfOOMN5JxtrVEEVcQ6O9IfINCVJNQdaYyuM
         7EWKQwjVhgcEkWEoxlD622BKsi6s2wodFsXQHYJquatAarIapQfcpBC21Nog6B1v+46a
         6nM90V6kXQzxeoXWb4vgBusi5v841vFBexg8LnKHHUkTFaAfqd1uODmk3zAv6FcSeDAK
         TFMp494sN6PSfzRF4WZEe7in7LV7DY6oz3OXpdv0G6X8e2r9CVbieT+NQxrwC6He+5Rd
         jtdREVKld0kccBwUKQYx5X+XQsmr89I3J1327uVBU+VW5pWRM3lilBP3cUDtrot0lyt1
         i3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knf4e9QJIMKImSV5qeMhnbOncjZp3zFKh9Lv4EXo6MI=;
        b=nri/7CfbjlqMPtzII/i/WR5IBjaoxNacB3FXtVly4b8zPb3ROkb4qB+wcaztkpZaRY
         C2P7d9qwUJt6idIqBps7b6pHt453xzW1AqGGdnofkf4zGj9/conYWcgd+v6+ilA/0E6d
         q8LzkKSur8+Xg+EPIPudgkyFgEAm0jQcNQjCpl3Acy1z01NH0W93T25/xyLrTNwdIrzI
         Ds7fTme943bEiaYwicA9X+IXfMzBNWtpUPxk3GxrjUFk76EeRuKE9uQLjqJ+iRpHpOeA
         v4fgdbFc3liyjc8JD9jCBzSBdGhhTsXhRibsPcUGn6P1o8PuyrSuZ72Otef2mL9DBlpl
         Pulg==
X-Gm-Message-State: AOAM532ncVAFOiq92PNpWl355Ey3FhKUnujih538rM7b0+uQl1CyfJZb
        THn7i3ziUyDVbeiSPzrm2cF5XxlC+VoIuA7J7OtqTw==
X-Google-Smtp-Source: ABdhPJwTokZ4kAaFQv9Jxk1a+fTmq1O0FERIIcZVPTaV5KnJIwVTRDNgPvKDt7D1S2aGqBQsIGzoTg28Yh71PEqRcfI=
X-Received: by 2002:a2e:9ec1:: with SMTP id h1mr24109147ljk.0.1628701488538;
 Wed, 11 Aug 2021 10:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210811172605.72d6650e@canb.auug.org.au>
In-Reply-To: <20210811172605.72d6650e@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 11 Aug 2021 10:04:36 -0700
Message-ID: <CAKwvOdkv+L6LQO2NPr7EmGS3mp3AN=5CBfFkS0v6YU4j4YAm6A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 11, 2021 at 12:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   Makefile
>
> between commit:
>
>   6f5b41a2f5a6 ("Makefile: move initial clang flag handling into scripts/Makefile.clang")
>   231ad7f409f1 ("Makefile: infer --target from ARCH for CC=clang")
>   f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1")
>
> from the kbuild tree and commit:
>
>   e17f1b1f3e01 ("Makefile: generate `CLANG_FLAGS` even in GCC builds")
>
> from the rust tree.
>
> I fixed it up (Makefile fix up at the bottom, plus the following patch)
> and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 11 Aug 2021 17:18:36 +1000
> Subject: [PATCH] fixup for rust integration with Makefile.clang creation
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Makefile               | 17 -----------------
>  scripts/Makefile.clang | 19 +++++++++++++------
>  2 files changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5d504a1dcb06..3638ce07f208 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -625,24 +625,7 @@ endif
>  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
>  CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
>
> -TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
> -
> -ifneq ($(CROSS_COMPILE),)
> -TENTATIVE_CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> -ifeq ($(LLVM_IAS),1)
> -TENTATIVE_CLANG_FLAGS  += -integrated-as
> -else
> -TENTATIVE_CLANG_FLAGS  += -no-integrated-as
> -GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -TENTATIVE_CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -endif
> -
> -export TENTATIVE_CLANG_FLAGS
> -
> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  include $(srctree)/scripts/Makefile.clang
> -endif

Thanks Stephen for taking the time to resolve this and send a patch.
We owe you one. We knew this conflict was coming.

Miguel, would you mind rolling this patch into your tree, then
crediting Stephen if possible (on the patch that adds
TENTATIVE_CLANG_FLAGS)?

I think the above `ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)`
should stay in the top level Makefile though. It does look nicer to
bury it in scripts/Makefile.clang, but I worry that someone doing a
GCC build might trip the $(error) in that file (if CROSS_COMPILE was
set and we're building a non-llvm-supported target).

Also, if you're rebasing the related patches, I hope we can use a
shorter identifier than TENTATIVE_CLANG_FLAGS? If they're used for
bindgen, maybe BINDGEN_FLAGS?

>
>  # Include this also for config targets because some architectures need
>  # cc-cross-prefix to determine CROSS_COMPILE.
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 3ae63bd35582..555b5255d9b3 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -12,24 +12,31 @@ CLANG_TARGET_FLAGS_s390             := s390x-linux-gnu
>  CLANG_TARGET_FLAGS_x86         := x86_64-linux-gnu
>  CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))
>
> +TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
> +
>  ifeq ($(CROSS_COMPILE),)
>  ifeq ($(CLANG_TARGET_FLAGS),)
>  $(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
>  else
> -CLANG_FLAGS    += --target=$(CLANG_TARGET_FLAGS)
> +TENTATIVE_CLANG_FLAGS  += --target=$(CLANG_TARGET_FLAGS)
>  endif # CLANG_TARGET_FLAGS
>  else
> -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +TENTATIVE_CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>
>  ifeq ($(LLVM_IAS),0)
> -CLANG_FLAGS    += -no-integrated-as
> +TENTATIVE_CLANG_FLAGS  += -no-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +TENTATIVE_CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  else
> -CLANG_FLAGS    += -integrated-as
> +TENTATIVE_CLANG_FLAGS  += -integrated-as
>  endif
> -CLANG_FLAGS    += -Werror=unknown-warning-option
> +
> +export TENTATIVE_CLANG_FLAGS
> +
> +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> +CLANG_FLAGS    += $(TENTATIVE_CLANG_FLAGS)
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> +endif
> --
> 2.30.2
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc Makefile
> index fcda81da6c20,c814b209b6c9..000000000000
> --- a/Makefile
> +++ b/Makefile
> @@@ -581,10 -613,28 +623,25 @@@ endi
>   # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
>   # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
>   # and from include/config/auto.conf.cmd to detect the compiler upgrade.
>  -CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
>  +CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
>
> + TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
> +
> + ifneq ($(CROSS_COMPILE),)
> + TENTATIVE_CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
> + endif
> + ifeq ($(LLVM_IAS),1)
> + TENTATIVE_CLANG_FLAGS += -integrated-as
> + else
> + TENTATIVE_CLANG_FLAGS += -no-integrated-as
> + GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> + TENTATIVE_CLANG_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> + endif
> +
> + export TENTATIVE_CLANG_FLAGS
> +
>   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  -CLANG_FLAGS   += $(TENTATIVE_CLANG_FLAGS)
>  -KBUILD_CFLAGS += $(CLANG_FLAGS)
>  -KBUILD_AFLAGS += $(CLANG_FLAGS)
>  -export CLANG_FLAGS
>  +include $(srctree)/scripts/Makefile.clang
>   endif
>
>   # Include this also for config targets because some architectures need
> @@@ -713,12 -763,11 +770,12 @@@ $(KCONFIG_CONFIG)
>   # This exploits the 'multi-target pattern rule' trick.
>   # The syncconfig should be executed only once to make all the targets.
>   # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
>  -quiet_cmd_syncconfig = SYNC    $@
>  -      cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
>  -
>  +#
>  +# Do not use $(call cmd,...) here. That would suppress prompts from syncconfig,
>  +# so you cannot notice that Kconfig is waiting for the user input.
> - %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
> + %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
>  -      +$(call cmd,syncconfig)
>  +      $(Q)$(kecho) "  SYNC    $@"
>  +      $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>   else # !may-sync-config
>   # External modules and some install targets need include/generated/autoconf.h
>   # and include/config/auto.conf but do not care if they are up-to-date.
> @@@ -848,8 -926,13 +939,13 @@@ els
>   DEBUG_CFLAGS  += -g
>   endif
>
>  -ifneq ($(LLVM_IAS),1)
>  +ifndef CONFIG_AS_IS_LLVM
>   KBUILD_AFLAGS += -Wa,-gdwarf-2
> + ifdef CONFIG_DEBUG_INFO_REDUCED
> + DEBUG_RUSTFLAGS += -Cdebuginfo=1
> + else
> + DEBUG_RUSTFLAGS += -Cdebuginfo=2
> + endif
>   endif
>
>   ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> @@@ -1201,9 -1327,12 +1305,12 @@@ archprepare: outputmakefile archheader
>   prepare0: archprepare
>         $(Q)$(MAKE) $(build)=scripts/mod
>         $(Q)$(MAKE) $(build)=.
> + ifdef CONFIG_RUST
> +       $(Q)$(MAKE) $(build)=rust
> + endif
>
>   # All the preparing..
>  -prepare: prepare0 prepare-objtool prepare-resolve_btfids
>  +prepare: prepare0
>
>   PHONY += remove-stale-files
>   remove-stale-files:



-- 
Thanks,
~Nick Desaulniers
