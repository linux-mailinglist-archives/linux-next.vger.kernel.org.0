Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4162A9864
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 16:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgKFPQT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 10:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgKFPQT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 10:16:19 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC179C0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4+WYl4Y99KMcpnDUmq0xOppvJ/gI1EBjcZfq0apHMtk=; b=AxiQ/QXcwbWI7fi+50Spmng50
        CTgriDdYt54GeVF601/d4JZyywA1Xn2/vmw+Uodmq2HSkwzBWAn8PTpf9O/CHTAOjZ+WeN2znu2wN
        AJTNtzMT/WZ7z9X/2M83oxX1mBeM805Ck5k9ZFmiIA/HJAltPnKFs+RKnKlfn5tdgfRLrLxIL+kXW
        xcl1DNaCmJyQSb3hDRAbEKiltG5MjbUlGx4cqsezMxRWDxWKIuYbRok67+L6ppMd7i28fEtx7cqQK
        hEMlV8kpH1bWntTHtaYCZ6WHHvZ4jT8qcg+xkkfQYkLjtD3PIE5cWh5FepZCfnPJSn+6/5JhYkE3L
        RndANvIfQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55826)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kb3T6-0005zp-J7; Fri, 06 Nov 2020 15:16:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kb3T0-0005vX-OG; Fri, 06 Nov 2020 15:15:54 +0000
Date:   Fri, 6 Nov 2020 15:15:54 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
Message-ID: <20201106151554.GU1551@shell.armlinux.org.uk>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org>
 <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86>
 <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2020 at 10:44 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > On Fri, Nov 06, 2020 at 09:28:09AM +0100, Ard Biesheuvel wrote:
> 
> > > AFAIK there is an incompatible change in -next to change the
> > > definition of the __alias() macro
> >
> > Indeed. The following diff needs to be applied as a fixup to
> > treewide-remove-stringification-from-__alias-macro-definition.patch in
> > mmotm.
> >
> > Cheers,
> > Nathan
> >
> > diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
> > index 8c0fa276d994..cc6198f8a348 100644
> > --- a/arch/arm/boot/compressed/string.c
> > +++ b/arch/arm/boot/compressed/string.c
> > @@ -21,9 +21,9 @@
> >  #undef memcpy
> >  #undef memmove
> >  #undef memset
> > -void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
> > -void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
> > -void *__memset(void *s, int c, size_t count) __alias(memset);
> > +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("memcpy");
> > +void *__memmove(void *__dest, __const void *__src, size_t count) __alias("memmove");
> > +void *__memset(void *s, int c, size_t count) __alias("memset");
> >  #endif
> >
> >  void *memcpy(void *__dest, __const void *__src, size_t __n)
> 
> Aha. So shall we submit this to Russell? I figure that his git will not
> build *without* the changes from mmotm?
> 
> That tree isn't using git either is it?
> 
> Is this one of those cases where we should ask Stephen R
> to carry this patch on top of -next until the merge window?

Another solution would be to drop 9017/2 ("Enable KASan for ARM")
until the following merge window, and queue up the non-conflicing
ARM KASan fixes in my "misc" branch along with the rest of KASan,
and the conflicting patches along with 9017/2 in the following
merge window.

That means delaying KASan enablement another three months or so,
but should result in less headaches about how to avoid build
breakage with different bits going through different trees.

Comments?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
