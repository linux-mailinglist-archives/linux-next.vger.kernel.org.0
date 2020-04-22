Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5071B464A
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 15:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgDVNeF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 09:34:05 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:58410 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgDVNeE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 09:34:04 -0400
Received: from gwarestrin.me.apana.org.au ([192.168.0.7] helo=gwarestrin.arnor.me.apana.org.au)
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1jRFVf-00015m-IR; Wed, 22 Apr 2020 23:33:52 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 22 Apr 2020 23:33:51 +1000
Date:   Wed, 22 Apr 2020 23:33:51 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shukun Tan <tanshukun1@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Zaibo Xu <xuzaibo@huawei.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20200422133351.GB7640@gondor.apana.org.au>
References: <20200421151240.4dfc679a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421151240.4dfc679a@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 21, 2020 at 03:12:40PM +1000, Stephen Rothwell wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Apr 2020 14:56:49 +1000
> Subject: [PATCH] crypto: hisilicon/qm add more ACPI dependencies
> 
> due to the selects of CRYPTO_DEV_HISI_QM which now depends on ACPI
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/crypto/hisilicon/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
