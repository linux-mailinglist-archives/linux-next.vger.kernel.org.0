Return-Path: <linux-next+bounces-9724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB1D3B7C9
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 149B4303CF5F
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C442DCF55;
	Mon, 19 Jan 2026 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glfVy3GD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833712DC793;
	Mon, 19 Jan 2026 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852568; cv=none; b=euVoWKyevuKfrxpnKdaraDXOLT1pUAQ4QA12vA57gSMefy/FdqCb2YH02P6UagDPm0YW8cm2YJQQ3VI/AUDoK9vQkXBlxl+WQCswM05FKU0vI4fHHr0Z9og0o4NNgBXsh5bHcvDdI227VUaCLeauLSVV9Bk//cblmy3iOm1d8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852568; c=relaxed/simple;
	bh=UrClcgHiZDlz6+YsxozSF+Ys+C/yfwMm+I9ix3JQK44=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=sqgwEDZkRIjd2Y7D1ORY2SOqwY+TVCoEkfImBSEoguX7sQi6jRYs9qr4unLkjuAEBt2tgnFXWLeNyWeqjwc4xPfVJ6HMkc06mV8ekiVHVgKiAYZw1fY2EpPI5jy4bFsjN1PhAkbRLZ9ahmIjMfOErOnj253yfK0sZ6NHkxuP66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glfVy3GD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF19FC116C6;
	Mon, 19 Jan 2026 19:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768852568;
	bh=UrClcgHiZDlz6+YsxozSF+Ys+C/yfwMm+I9ix3JQK44=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=glfVy3GD3lAIQlwlO52NcI7r5lcJAfNyw5nO5S7DkOQcjb1iKqc617D/Em6Hv6UCq
	 VyX8QjB2s9YIxzCcxjzaXCa6tH+2Y4PZGJOB5b4w22g2I+13+GNgBfDSb87G3keJJ2
	 tUM9u+Mtw66qsJrEwucxGxbKJV7yglS/vmXSwuJLntvcu2B2QyMg+cPBbt4qFh2+yM
	 4JJGEXk82UNXRIMcL8P8Dl/ad8P/iD30n2kkQEqHeQhAf8FIdhrddgoA9YMEkGvred
	 SFDGp0Ji3jPOrWSgb61/mLkcJPm0MVRhCuUoz+sHLTl+NVnYRR+eW5NomYoDI2JC4A
	 5vyVXd3NObZrw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 20:56:05 +0100
Message-Id: <DFSTWIKVTPPV.30JGGJ2XFT9SA@kernel.org>
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
References: <aW6GNvuQVNCUcoy-@sirena.org.uk>
In-Reply-To: <aW6GNvuQVNCUcoy-@sirena.org.uk>

On Mon Jan 19, 2026 at 8:29 PM CET, Mark Brown wrote:
> After merging the driver-core tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>
> ERROR: modpost: missing MODULE_LICENSE() in drivers/base/revocable_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/revocable_=
test.o

Thanks for the report, I sent out a fix [1].

[1] https://lore.kernel.org/lkml/20260119195141.12843-1-dakr@kernel.org/

