Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD47B189F74
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 16:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgCRPRD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 11:17:03 -0400
Received: from mail.skyhub.de ([5.9.137.197]:47772 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726857AbgCRPRD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 11:17:03 -0400
Received: from zn.tnic (p200300EC2F0B45007D4ACA8DC0CAA93C.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:4500:7d4a:ca8d:c0ca:a93c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4F7541EC0716;
        Wed, 18 Mar 2020 16:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1584544622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=LZICIKccfnDcmp2pEkUNVT+o+1qQEVocV4Y4bj2fG2A=;
        b=SxxGlhvTmPYYrOKxduf8fZsIFQjjB2VsXUhTnZv3ev8z/agI+l23nTVxYsAA7QKV1wDfVp
        EMuvKP7cdw6sqBYfOIl5SDHRfuiHrBdWkASjmlDQ8db+JCWBdAuMOoJY1a6eL+OZOe1AcZ
        yFv5dv1Coel4omYIlliOUfo9eS0MGkc=
Date:   Wed, 18 Mar 2020 16:17:07 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: linux-next: Tree for Mar 16 (arch/x86/mm/ioremap.o)
Message-ID: <20200318151707.GB4377@zn.tnic>
References: <20200316183039.0d1c45ce@canb.auug.org.au>
 <7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 10:48:25AM -0700, Randy Dunlap wrote:
> On 3/16/20 12:30 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200313:
> > 
> 
> 
> on x86_64:
> 
> ld: arch/x86/mm/ioremap.o: in function `__ioremap_caller':
> ioremap.c:(.text+0x150): undefined reference to `efi_mem_type'

Working on it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
