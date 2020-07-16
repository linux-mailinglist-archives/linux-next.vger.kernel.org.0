Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AD82218C9
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 02:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgGPAZk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 20:25:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgGPAZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jul 2020 20:25:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B27F0206F5;
        Thu, 16 Jul 2020 00:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594859139;
        bh=mnQWCm2hg3t/Lu5Zz8FqJFGWczJ0dV8yPPweCks0o6A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hAZFFnNjZycCAbywuOS9nVgtGpjGY4Uqrrw53T/+0Fqb9ucXwYttkeJ5FxpGIVK/A
         ks7GJXzomRYySVlT3Gzr3DMuiG+NMX5hHynZdFDYmJ/6AGrwCsgg2nNmFzlYgmKpGx
         Tyus4AVItqeFnHXt9NIzClkA3PaPBZifT+/UFnLw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200708211044.3032905d@canb.auug.org.au>
References: <20200630095341.0f4ae8ed@canb.auug.org.au> <20200630081115.mmqdsm3vlnj4yagu@gilmour.lan> <20200708211044.3032905d@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 15 Jul 2020 17:25:38 -0700
Message-ID: <159485913896.1987609.15038060066931263381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-07-08 04:10:44)
> Hi all,
>=20
> On Tue, 30 Jun 2020 10:11:15 +0200 Maxime Ripard <maxime@cerno.tech> wrot=
e:
> >
> > On Tue, Jun 30, 2020 at 09:53:41AM +1000, Stephen Rothwell wrote:
> > > After merging the clk tree, today's linux-next build (x86_64 allmodco=
nfig)
> > > produced this warning:
> > >=20
> > > WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/bcm/clk-bcm=
2711-dvp.o
> > >=20
> > > Introduced by commit
> > >=20
> > >   1bc95972715a ("clk: bcm: Add BCM2711 DVP driver") =20
> >=20
> > I've posted a patch solving this already:
> > https://lore.kernel.org/linux-clk/20200626112513.90816-1-maxime@cerno.t=
ech/
> >=20
> > And it's supposed to be in clk-next since friday, but it looks like
> > stephen didn't push his branch?
>=20
> I am still getting this warning.
>=20

Sorry I forgot to push it out. Should be fixed now.
