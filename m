Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7084A29C4
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfH2W3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:29:35 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51873 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbfH2W3f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 18:29:35 -0400
Received: from p5de0b6c5.dip0.t-ipconnect.de ([93.224.182.197] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1i3Suw-0008OT-7i; Fri, 30 Aug 2019 00:29:23 +0200
Date:   Fri, 30 Aug 2019 00:29:21 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning from Linus' tree
In-Reply-To: <20190830082357.4650d243@canb.auug.org.au>
Message-ID: <alpine.DEB.2.21.1908300028360.1938@nanos.tec.linutronix.de>
References: <20190830082357.4650d243@canb.auug.org.au>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

On Fri, 30 Aug 2019, Stephen Rothwell wrote:

> Hi all,
> 
> From Linus tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> arch/x86/boot/edd.c: In function 'query_edd':
> arch/x86/boot/edd.c:148:11: warning: taking address of packed member of 'struct boot_params' may result in an unaligned pointer value [-Waddress-of-packed-member]
>   148 |  mbrptr = boot_params.edd_mbr_sig_buffer;
>       |           ^~~~~~~~~~~
> 
> I assume this is a result of upgrading my x86_64 cross compiler to v9.2.1
> (from v8.3.0).

Yes. We have a fix queued which should hit next tomorrow.

Thanks,

	tglx
