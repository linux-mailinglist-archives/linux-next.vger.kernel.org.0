Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17DD31E9361
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 21:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbgE3T2B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 15:28:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgE3T2B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 30 May 2020 15:28:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6ED4B20722;
        Sat, 30 May 2020 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590866880;
        bh=ffeRgnoB73U8G+9CbTcdGz+cRwm33EHgvBLxDiU91RI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RvnX5HHCuabrUwqsAJPFuDt4YmnKEyHblTBaIgWyxgST3eLccTX0JKpSUqpVLxi+6
         6OzlJgTGN/YVcNz9iMZoyV/sm6R9WDM79IsW+JbTYBiWOZItCOKhqFDvhjFydzUsz5
         nHRIazVT0ffd3erjPH7PDIeYGDSTnWHBT+NogK58=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200530145624.30d0e400@canb.auug.org.au>
References: <20200530145624.30d0e400@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Sat, 30 May 2020 12:27:59 -0700
Message-ID: <159086687976.69627.3942972165401760107@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-05-29 21:56:24)
> Hi all,
>=20
> Commit
>=20
>   5f2feacb7639 ("clk: vc5: Add support for IDT VersaClock 5P49V6965")
>=20
> is missing a Signed-off-by from its committer.
>=20

Thanks. I don't know what went wrong with that patch application but
I've fixed it now.
