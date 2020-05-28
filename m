Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B490D1E5812
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 09:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgE1HCI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 03:02:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgE1HCI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 03:02:08 -0400
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1A0C207E8;
        Thu, 28 May 2020 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590649327;
        bh=fCUJQmwr/aKM661Ls+w61BeZtNki7as2j8d1qYO5xvU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Spe5F9H4rovlWiedWC5x7XaOgNYpp2k4lyKeLjqUi2bC9XLSFsO3Wrpg2AgsJMN1u
         PYlu8xfAX9swVOnTn5UX+6/JN0BLoU+46MHRlVufIA2aEQavkB3bIfmuZu8pt02W1W
         bGIJ98MdMsAJjMZ7XFK2SKziZuHkzRmC1G8/fjd8=
Received: by mail-io1-f53.google.com with SMTP id f3so28896973ioj.1;
        Thu, 28 May 2020 00:02:07 -0700 (PDT)
X-Gm-Message-State: AOAM533cgk5WVW9XrLTD1Oqr3kZWsWlOdAdwaNQkRFaN7oHCO8Hr5ZuS
        Z5HegFT2pbxwAOPSuBNFvcRyU4kfwIYkyjrX+O4=
X-Google-Smtp-Source: ABdhPJzkoBeVUbPYFnX6FWRCiHse7vbYXOG2EbPeWBa1LF/vKTm/kFuEBy2trHjSjDxwnqR6GuDlCY6hdakk08TgKAE=
X-Received: by 2002:a05:6638:a50:: with SMTP id 16mr1068249jap.71.1590649327232;
 Thu, 28 May 2020 00:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200528090941.341ad93a@canb.auug.org.au> <20200527232257.GS1551@shell.armlinux.org.uk>
In-Reply-To: <20200527232257.GS1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 28 May 2020 09:01:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
Message-ID: <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 May 2020 at 01:23, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> Ard,
>
> Please take a look.  Obviously, whatever the resolution is going to be
> needed when Linus opens the merge window.
>

Sorry for that.

I have pushed the signed tag below to resolve it. Those changes were
already in v5.7-rc2, so I wouldn't expect this to cause more trouble.
If you prefer, you could merge v5.7-rc2 into your tree directly
instead.



The following changes since commit d0f9ca9be11f25ef4151195eab7ea36d136084f6:

  ARM: decompressor: run decompressor in place if loaded via UEFI
(2020-05-19 18:23:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
efi-arm-resolve-conflict-v5.8-for-rmk

for you to fetch changes up to 5aa87eb1b4e3f1b50ee4a42e8cd933d3d39927b3:

  Merge commit 'a94691680bac' into efi-arm-no-relocate to resolve
conflict (2020-05-28 08:50:46 +0200)

----------------------------------------------------------------
Resolve a merge conflict between v5.7-rc2 and rmk/for-next

----------------------------------------------------------------

Ard Biesheuvel (2):
      efi/arm: Deal with ADR going out of range in efi_enter_kernel()
      Merge commit 'a94691680bac' into efi-arm-no-relocate to resolve conflict

Arvind Sankar (2):
      efi/x86: Move efi stub globals from .bss to .data
      efi/x86: Always relocate the kernel for EFI handover entry

Colin Ian King (1):
      efi/libstub/x86: Remove redundant assignment to pointer hdr

Takashi Iwai (1):
      efi/cper: Use scnprintf() for avoiding potential buffer overflow


 drivers/firmware/efi/cper.c             |  2 +-
 drivers/firmware/efi/libstub/efistub.h  |  2 +-
 drivers/firmware/efi/libstub/x86-stub.c | 18 +++++++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)
