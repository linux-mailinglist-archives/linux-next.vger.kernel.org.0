Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626FC1E8FDE
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 10:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgE3Ivp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 04:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgE3Ivo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 30 May 2020 04:51:44 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4898820776;
        Sat, 30 May 2020 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590828704;
        bh=CQtWLU30R03KOFPp9+myfIMWdvjkaPynLiq797nQvus=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UdaPlVeRCongJRSQVKvusVVEsMfTEG42Qa4/GJq2ry9rDgVlF4SeyvmSH/iVh5h9L
         Nhsc6G3YipdYw7bA8PevatJw4OR3spiXJkAASCawFKT/T074WmRiMVmLbwW7ukkAr5
         SR2Z0YjWBNXjTJ7OUtEMdsjbahD0y0TCq1ab+QB0=
Received: by mail-il1-f179.google.com with SMTP id l20so4782293ilj.10;
        Sat, 30 May 2020 01:51:44 -0700 (PDT)
X-Gm-Message-State: AOAM531swnSn5t+GiLhwhwmCl+fqFjb9ydQZ1Elrr+QBoVfzx52HfbqK
        xKzN31bP68rvzFG+8M9Dta3ybcQD7YTuP0Jymt8=
X-Google-Smtp-Source: ABdhPJy6kANjl2Pi1bUnYAZ+eR50eLlmAxXgyWw1z4LUchvYCc+HGU4Ewzej63/xqr6B2/ZpPYScGLlqYSWtufuU980=
X-Received: by 2002:a92:bb55:: with SMTP id w82mr11503605ili.211.1590828703752;
 Sat, 30 May 2020 01:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200528090941.341ad93a@canb.auug.org.au> <20200527232257.GS1551@shell.armlinux.org.uk>
 <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com> <20200530084103.GC1551@shell.armlinux.org.uk>
In-Reply-To: <20200530084103.GC1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sat, 30 May 2020 10:51:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
Message-ID: <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
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

On Sat, 30 May 2020 at 10:41, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Thu, May 28, 2020 at 09:01:55AM +0200, Ard Biesheuvel wrote:
> > On Thu, 28 May 2020 at 01:23, Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > > Ard,
> > >
> > > Please take a look.  Obviously, whatever the resolution is going to be
> > > needed when Linus opens the merge window.
> > >
> >
> > Sorry for that.
> >
> > I have pushed the signed tag below to resolve it. Those changes were
> > already in v5.7-rc2, so I wouldn't expect this to cause more trouble.
> > If you prefer, you could merge v5.7-rc2 into your tree directly
> > instead.
>
> In light of Stephen's report of a different conflict on the 29th, I
> haven't pulled this.  I don't know if that's a side effect of this
> change having been picked up by -next or not.
>

Fair enough. Both conflicts are unambiguous and self explanatory so I
don't think it should be a problem, right?
