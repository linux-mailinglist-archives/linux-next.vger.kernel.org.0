Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDEBD18A334
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 20:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgCRTes (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 15:34:48 -0400
Received: from mail.skyhub.de ([5.9.137.197]:34030 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgCRTes (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 15:34:48 -0400
Received: from zn.tnic (p200300EC2F0B450051E70FD0A142DE40.dip0.t-ipconnect.de [IPv6:2003:ec:2f0b:4500:51e7:fd0:a142:de40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9D5291EC0CFB;
        Wed, 18 Mar 2020 20:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1584560086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=bKnpn3BMk1wlmS/cNZ2WQdLkuQrg/NQUntuPCp9U2i4=;
        b=q1UxgFkQIknZ8cUVhdx8o7EH/JZg9hvxxRoXFzkjM0Rev8oQJE2mFwGLz30ZF8A3uKmBta
        QN9eGqP4IGYCJOMJPZJCtATOTT4I+XEtMaw4eKAJ8OzkPRsdadiJS5N3qvA7xU8hhPD9Gv
        yBtbJDaxvI5q7/r3uvnGBzqmiKbd1fY=
Date:   Wed, 18 Mar 2020 20:34:51 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH] x86/ioremap: Fix CONFIG_EFI=n build
Message-ID: <20200318193451.GD4377@zn.tnic>
References: <20200316183039.0d1c45ce@canb.auug.org.au>
 <7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org>
 <20200318151707.GB4377@zn.tnic>
 <20200318183451.GC4377@zn.tnic>
 <cf994608-c5cc-6e0b-6fd3-a7975cc4c8cf@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf994608-c5cc-6e0b-6fd3-a7975cc4c8cf@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 12:30:09PM -0700, Randy Dunlap wrote:
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

So

Tested-by: Randy Dunlap ...

?

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
