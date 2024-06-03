Return-Path: <linux-next+bounces-2451-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3D8D7AB6
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 06:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93E5EB20CD3
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 04:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20232FBF3;
	Mon,  3 Jun 2024 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GA7i5jyH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABCA10F1;
	Mon,  3 Jun 2024 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717388413; cv=none; b=bC/9BCHYmnvPq0qbVBxddH/sN5deLuQzhtnBYP0jgis6KgmKM0s5FWnQfjCf8YMPuUK+sCMM/4bB0ak7KZTdadql1HdSNxx/EAgESx2pDUwowEKErPSqfgt7zr1GNJRURtRy+jUlYOkQNs8mwU8rpWmTsz1n2rU7PzZeDhNWnNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717388413; c=relaxed/simple;
	bh=T4P767ww2/x3jH+PERXYM2WqkwiMDoGRFxv3GqDt0y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iowBsiAlvdRsDxpiUUCaeO6agWyFM9kTakx1uuTWjU+S5fBR44dgbnbqYuENJxwDSu5kqsy41cUiRI+NTAPEMof/xB7vwoHReMLZ0nJ8JSmlI8Gt+G8KF11LouxHXRvecdtZEHdINCFvHsUWkOFxx9DYn87JoYE7YxPphomwq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GA7i5jyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ABFC2BD10;
	Mon,  3 Jun 2024 04:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717388412;
	bh=T4P767ww2/x3jH+PERXYM2WqkwiMDoGRFxv3GqDt0y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GA7i5jyHumlEPqBbHPtyyQDLB15JrUrB70DGWLV34cRxfGRmK9kp2ntC4nO9Wi0oL
	 Yd2ZJiQHGEH7XU6/OxCwNphi6YuYc65uX6elAyRhMvwzX0ESBv63GUvflJ5iz/s1GY
	 7bSCFfS2b5a8MmR8w53EnRK4+7Iu0ZlpE343WvwljKDimS6C37VvJhVnA2Hyq2ueW6
	 QWWebf6/7fQpBaFVhcDXXSjoSx14/fA6VHjSgJnMq4p7MNpG0J72leGS1LRgkyoEqr
	 QNYb+PmP+MbBqd6ydB61N7fMyhMDEXmnxMTTkTNxH0EDjlP7qv1UqohutumxsQbFlo
	 fci9Q9IoNAnfw==
Date: Mon, 3 Jun 2024 04:20:09 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benson Leung <bleung@google.com>, Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the chrome-platform tree
Message-ID: <Zl1EefBEvsQgnEZv@google.com>
References: <20240603132517.7f344f9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603132517.7f344f9f@canb.auug.org.au>

On Mon, Jun 03, 2024 at 01:25:36PM +1000, Stephen Rothwell wrote:
> After merging the chrome-platform tree, today's linux-next build
> (htmldocs) produced this warning:
> 
> MAINTAINERS:11167: WARNING: unknown document: '../hwmon/chros_ec_hwmon'
> 
> Introduced by commit
> 
>   e8665a172378 ("hwmon: add ChromeOS EC driver")

A typo in the applied patch.  Fixed.

