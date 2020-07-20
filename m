Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E6F225E07
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 14:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgGTL74 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 07:59:56 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:53842 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728058AbgGTL7z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jul 2020 07:59:55 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jxURi-0000wa-0h; Mon, 20 Jul 2020 21:59:03 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Mon, 20 Jul 2020 21:59:01 +1000
Date:   Mon, 20 Jul 2020 21:59:01 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Uros Bizjak <ubizjak@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200720115901.GA12066@gondor.apana.org.au>
References: <20200717144656.4bdbf81f@canb.auug.org.au>
 <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
 <20200717064401.GB2504@gondor.apana.org.au>
 <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 09:31:18AM +0200, Uros Bizjak wrote:
> Please find attached the incremental patch that puts back integer
> parts of inst.h. This resolves the conflict with the tip tree.

Sorry but you can't send a patch without changing the Subject line
as otherwise patchwork will simply treat it as a comment or just
ignore it.

Please resend.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
