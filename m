Return-Path: <linux-next+bounces-3039-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14431932FE5
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 20:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4605A1C22284
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 18:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0431419DFBB;
	Tue, 16 Jul 2024 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdatQU48"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22971C6B7;
	Tue, 16 Jul 2024 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154380; cv=none; b=By0fCv+GrKm9nXUx/zk2bUaW7Zx/Mz0RYbue2Ayvny8dwfj9nct7BaoS5NzlvFX3ZsDPryuJVAIUmqFaxKQC02wH55K1NctcG76yVQJpjrKUILRe6w5vBKkNDRR0er36bTNeAbIpZUj6XyG3WV2Ukx9zS3hkUQkWmvU9/a3QPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154380; c=relaxed/simple;
	bh=jipxMlasX3Fw7vlfIkHvYUScSy61OMBIcgaDN2Vu2/s=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kmsMUXW94mUvUbwrO38sP5mhUTFNX/N/kbSzyup1AAqM1mLgPXW2rEmMiUiQRR7WjRNvNmVC1PE9PV5jnWXM3zVv7hK0ExlotkeIfZFgM4bxdVKwVAq/Bbdn6RxsNO36tCwPrgXxE2BXab6eJRk8RFmmQ1kKrZtd66Q4aj4q8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdatQU48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC39C116B1;
	Tue, 16 Jul 2024 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154380;
	bh=jipxMlasX3Fw7vlfIkHvYUScSy61OMBIcgaDN2Vu2/s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hdatQU48rZibLpZ02stZLD7dhnDdbBZX8PrmhcRXAqyRCd6Kj4NhuabC7V2byUgRy
	 PFZPoqAy+R+woo8eBi+xmBXNj/FhI9ItGW3vWKZA9LJ4brawK7IWPflYJF0qlvw8Ip
	 bZmZV83ukQ3rk/eVuZJSnd0bM+JsJbF92cvqOX1u1TbLe/DFznRoTTsS0Sxh5mnK0D
	 6ex3kczQJKGGw4m6HAn3w+fG68nHZdNZ8Yxuo7PQ5BL59Y4Ulcfrd5W+kil3uCJ5ol
	 VaeDEcBkRAaNY66Or6G9/Dar1xno9id6jT2NS19g9gFnJ/goqSJiMB5wBqRDPLDaLq
	 fquBmr/NvOWAQ==
Message-ID: <643dae8ca76a7d11ea6df6c2242a6f4f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240716104150.3e99e835@canb.auug.org.au>
References: <20240716104150.3e99e835@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the clk tree
From: Stephen Boyd <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 16 Jul 2024 11:26:18 -0700
User-Agent: alot/0.10

Quoting Stephen Rothwell (2024-07-15 17:41:50)
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in drivers/of/of_kunit_helpers.o
> ERROR: modpost: missing MODULE_LICENSE() in drivers/of/kunit_overlay_test=
.dtbo.o
> ERROR: modpost: "device_is_bound" [lib/kunit/kunit.ko] undefined!
> ERROR: modpost: "__dtbo_kunit_overlay_test_end" [drivers/of/overlay_test.=
ko] undefined!
> ERROR: modpost: "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_tes=
t.ko] undefined!
>=20
> Presumably caused by commit
>=20
>   aa46879db9ac ("of: Add a KUnit test for overlays and test managed APIs")
>=20
> I have used the clk tree from next-20240715 for today.

Thanks. I didn't see this with an allmodconfig so I'm going to debug my
testing scripts after dropping these patches from -next.

