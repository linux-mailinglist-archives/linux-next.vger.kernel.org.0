Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 297321982D0
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 19:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgC3Ryj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 13:54:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36481 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbgC3Ryj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 13:54:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so22785226wrs.3
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2020 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utW+7YJkRuGqH8XK7nqVWH149nVP6e/z3NiTESoZJ6I=;
        b=FUM/Log5Gw5uixyZLFfSJCSdgQdC9uA76xrChs16wy5iNS75Rmzu4dn06dHbbaqEit
         ghRrrro2jkjKhoIsDZgxiwceZIGwOOz9ZhOJQ8t7wUcny1DlafqxQZ7bfiYypLtBEBZj
         9WolA73ts7cOv3ZaPB3DCzcc25CpUytxEw5pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utW+7YJkRuGqH8XK7nqVWH149nVP6e/z3NiTESoZJ6I=;
        b=DPVYN+4yZ/wgJmEnErQ3zQWaNMUopDKqKNQJu3DaBIfyH7bRFdo8hFUsNtdTgX7XHE
         zKtVhplbuWtzjifNvdWI62+aihf4X2T8ckwjZN8wNg8gyNzeRZxCLq7xO+YNdW/uviXl
         Lno9ItzqfG696JJiu1VvrKjSWvYQ9hmJHki4pVhvUlZthqRUTytnPd+P2GuCQOpFPJZ/
         Z91UJ9Io73fdQx0UwzLMD/irXtTtIjwmsHuZ4KdujLnDryR/t8As01ZU2S0us561xRMF
         bqzbtZpnxPPmpzW78pqQ9gww+Ig1hBz1CT+zNbwOAvEGblIpV4ThmXx8KXaPpG+sl78u
         6hHg==
X-Gm-Message-State: ANhLgQ2/tQmhzOIK8MrTbWmTADwGQ+LW69J/jJWuT2Ua9yl9UbF4sOaa
        81VpGzp1HO3EU/fEz8LbbbzFy2qfWBtEezpYy+Ctog==
X-Google-Smtp-Source: ADFU+vsUn9IsKe0gSvckJlw0u4Px0D/tzS/kNZ/jnXIKvDX6ef/ApzKlvKspnJvAglkMak8cC2//FXu1A1VOWCpgq60=
X-Received: by 2002:a5d:4847:: with SMTP id n7mr16829913wrs.182.1585590876589;
 Mon, 30 Mar 2020 10:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200330204307.669bbb4d@canb.auug.org.au> <86f7031a-57c6-5d50-2788-ae0e06a7c138@infradead.org>
 <d5b4bd95-7ef9-58cb-1955-900e6edb2467@iogearbox.net>
In-Reply-To: <d5b4bd95-7ef9-58cb-1955-900e6edb2467@iogearbox.net>
From:   KP Singh <kpsingh@chromium.org>
Date:   Mon, 30 Mar 2020 19:54:25 +0200
Message-ID: <CACYkzJ72Uy9mnenO04OJaKH=Bk4ZENKJb9yw6i+EhJUa+ygngQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 30 (bpf)
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for adding me Daniel, taking a look.

- KP

On Mon, Mar 30, 2020 at 7:25 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> [Cc KP, ptal]
>
> On 3/30/20 7:15 PM, Randy Dunlap wrote:
> > On 3/30/20 2:43 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> The merge window has opened, so please do not add any material for the
> >> next release into your linux-next included trees/branches until after
> >> the merge window closes.
> >>
> >> Changes since 20200327:
> >
> > (note: linux-next is based on linux 5.6-rc7)
> >
> >
> > on i386:
> >
> > ld: kernel/bpf/bpf_lsm.o:(.rodata+0x0): undefined reference to `bpf_tracing_func_proto'
> >
> >
> > Full randconfig file is attached.
> >
>
