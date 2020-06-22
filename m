Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A6E203A74
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 17:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgFVPPH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 11:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbgFVPPH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 11:15:07 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05036C061573;
        Mon, 22 Jun 2020 08:15:07 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0a2500329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:2500:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8AA271EC02B9;
        Mon, 22 Jun 2020 17:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1592838905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=poCjt5Hnl2yRbfjwza7dJmmzO9NHIwqXjUHnukTHB7k=;
        b=OTqVZBcmrQ4C/T8Pc6e4GzXfK3N3Ei8V1CKLAm443rbMtEtWDzOBDD3UXhEa581dDQdKgG
        S53OljfjyDy6zfTko/ld3OsUeGy2gkvxl7LzdEgS8AVgVrXMpwoUgVHmyaKDtDw9SgGNUg
        0ic4YC7Vxn7e8HylaUZPP0pIkejMXjU=
Date:   Mon, 22 Jun 2020 17:15:02 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH -v2] x86/msr: Move the F15h MSRs where they belong
Message-ID: <20200622151502.GE32200@zn.tnic>
References: <20200621163323.14e8533f@canb.auug.org.au>
 <20200621105350.GA28206@zn.tnic>
 <20200622113824.6a3ab82f@canb.auug.org.au>
 <20200622130407.GB32200@zn.tnic>
 <20200622141737.GA30611@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200622141737.GA30611@kernel.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 22, 2020 at 11:17:37AM -0300, Arnaldo Carvalho de Melo wrote:
> So this reverts the change you made to the tools copy of that file and
> then does the change you need to the kernel sources, ok.
>
> In the future the change will be made just in the kernel files, as
> kernel developers don't have to have the burden of checking if tooling
> continues to work when they change kernel files.

Always nice to have less work. :-)

> That way later the perf developers get the warning in the perf build
> process, see how this change in a file that is a copy from the kernel
> sources affects tooling, and act upon it, simply updating the copy or
> doing that + extra tooling adjustments, perhaps a new feature, etc.

Nice.

> Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Thanks, queueing.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
