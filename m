Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD8227F69A
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 02:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgJAAWI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 20:22:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730258AbgJAAWI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 20:22:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5312207C3;
        Thu,  1 Oct 2020 00:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601511727;
        bh=P0GOJlLoIg+1rmk9lqXN+j1FqQgUxb+yJbLnN9iX4Is=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oycpxr7iBffWz9n3vhvI1SX9KIVxsSLPlv3aTCq8oQp6skgIZ8odBHa85F/ZGe6h4
         JfZKKFQIwxGKiyX9/iQs4F16+vMDWzeMLmTGkIy2en8DCvTAzESWLe9CnQixByAVpv
         HkHh6+6JSPfHN0q43bkXHIaJTxe8W05j3L5jvGOQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923214632.079690f6@canb.auug.org.au>
References: <20200923214632.079690f6@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 30 Sep 2020 17:22:06 -0700
Message-ID: <160151172628.310579.596467424545504483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-09-23 04:46:32)
> Hi all,
>=20
> In commit
>=20
>   b02cf0c4736c ("clk: socfpga: stratix10: fix the divider for the emac_pt=
p_free_clk")
>=20
> Fixes tag
>=20
>   Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>=20
> Please do not split Fixes tags over more that one line.
>=20

Thanks for pointing that out. Is this part of checkpatch? I run
checkpatch on most patches and didn't see any complaint.
