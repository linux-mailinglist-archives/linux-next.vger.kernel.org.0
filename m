Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217C9EFCBA
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 12:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730993AbfKELxB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 06:53:01 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:41004 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730667AbfKELxB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 06:53:01 -0500
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iRxOE-00030G-Vz; Tue, 05 Nov 2019 12:52:51 +0100
Date:   Tue, 5 Nov 2019 12:52:50 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jan Beulich <jbeulich@suse.com>,
        Fabien Parent <fparent@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: Fixes tags need some work in the tip tree
In-Reply-To: <20191105221830.69ec8bcc@canb.auug.org.au>
Message-ID: <alpine.DEB.2.21.1911051250510.17054@nanos.tec.linutronix.de>
References: <20191105221830.69ec8bcc@canb.auug.org.au>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 5 Nov 2019, Stephen Rothwell wrote:
> In commit
> 
>   fe6f85ca121e ("x86/apic/32: Avoid bogus LDR warnings")
> 
> Fixes tag
> 
>   Fixes: bae3a8d3308 ("x86/apic: Do not initialize LDR and DFR for bigsmp")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Yes. I missed that one when applying the patch which had the fixes tag
already inside. Will add a check for that to catch future ones.

Jan, please adjust your git settings.

Thanks,

	tglx
