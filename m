Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 497AB90785
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 20:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfHPSKu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 14:10:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbfHPSKu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 14:10:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 630BE206C1;
        Fri, 16 Aug 2019 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565979049;
        bh=fBQlqgxXYPI0RkjnntUMMTiPaFT42DbZYk7AS2AaI3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=krWHY1dunHLyUbvxAfCDNdlGP6QF/TAX1ZJ4C0TMr6MyKov9423pxkuVdAj9jTWJ6
         bnoutNGfY9zTEK53glcupWVknQuVdpfrEZh04Nd87updB76f8v9pFctGN8votcfI5/
         ILruZtwchp+7P8ds5SOZuE2tOmvJKdYtlciR87O0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190816095732.0ffea609@canb.auug.org.au>
References: <20190816095732.0ffea609@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 11:10:48 -0700
Message-Id: <20190816181049.630BE206C1@mail.kernel.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2019-08-15 16:57:32)
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> drivers/clk/actions/owl-common.c: In function 'owl_clk_probe':
> drivers/clk/actions/owl-common.c:71:24: warning: 'hw' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
>    const char *name =3D hw->init->name;
>                       ~~^~~~~~
>=20
> Introduced by commit
>=20
>   20cac6d02815 ("clk: actions: Don't reference clk_init_data after regist=
ration")
>=20
> Clearly not a false positive. :-(
>=20

Thanks. I fixed it now.

