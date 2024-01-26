Return-Path: <linux-next+bounces-874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA083DAED
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 14:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3E0A1C217BD
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 13:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9431B81B;
	Fri, 26 Jan 2024 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEC2cmER"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699ADBA39
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706276002; cv=none; b=HQFMcKeXl1FCqw9psArz+7ajoMz5hR3r7G446o28XXasnyK8MOqGEx50lib/YT2yI/2vJAmwaHyyEktHtmvT7etSw24zIogABKeXHn7ogvG72R3t9EwUZ15rHnG2OG+L2xdm0WMlfptmyQ3kHfOA7Wf1XVXTvo0f+0YpKj6/rdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706276002; c=relaxed/simple;
	bh=0TBaa82xBFZ8qgC/54GyQl7mDFy5eDqUdzZ5B2/PnGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFOKRvw+ulHfNJ4HuUnpZDE79AR20xPC1PtRBu7PmCzVmg4O44l/OFMLyCUoC10ug/DYNCTND3/KDWMNkOnPENKQ2+eunAahP5dCMuUSSE6uk9XOWRAU4u3hALL8rIuXrhZ9h33HTrT2SAfFBXVzM11ZiOiMXT2vaPKQaYSZmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEC2cmER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B945C433C7;
	Fri, 26 Jan 2024 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706276001;
	bh=0TBaa82xBFZ8qgC/54GyQl7mDFy5eDqUdzZ5B2/PnGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEC2cmER/vqytjyx2Cs6MT+SP+SIkb6QY3KNqrkS917NASuJQI6lXvDW+rsZ4Dyfc
	 osEzWNd2/ElPssf8d8CnwDBbBsO77anA4YCREPV0QwRQnBKfW38BwGSefqfImFYaIa
	 mwa7hbEikv7mbCTIynu4sdvyLrJrsYjTP57Luce5wjmck8X2SXFrX9Y2ou5LbTrr2d
	 3ipqUPE1L+3WehVTdGM6E6pgzV9HVoHLDrPCXnEMile1dpfqXA1V+h43F90JrbCtZD
	 7BtqaUH+fX2622t4/7UaRxdOMAy65AY0SpN2/5jHr09Lpo4dP5rCBzyXJQQSSZGhUz
	 wLOpTDt8CLQLQ==
Date: Fri, 26 Jan 2024 14:33:18 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <ZbO0nuqboURn-hy0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next <linux-next@vger.kernel.org>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
 <qztustevwvwnfjrcour5hpxvik7ryhbyhxn5nzyosdvjdpdife@2a5orr4yo5db>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ErUevg9i5Um2IOcr"
Content-Disposition: inline
In-Reply-To: <qztustevwvwnfjrcour5hpxvik7ryhbyhxn5nzyosdvjdpdife@2a5orr4yo5db>


--ErUevg9i5Um2IOcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> whichever you prefer. There you will see the two branches. I am
> trying to copy Wolfram's way of doing things.

If you copy my style, then only for-next goes to linux-next.

I have branches for-mergewindow and for-current which I let Linus pull.
I merge both branches into for-next for Stephen.


--ErUevg9i5Um2IOcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWztJoACgkQFA3kzBSg
Kbb5VQ/+KR6XZ95UUYurx3TT1fbOtUwAwMCSnEj74lXdAUCbF5dIcpAOTkNq56BA
VbOfmwN7Tg5wormWEzenFu8VIkDvh8/Ka/qbX3FdgjdTx3fbhRhMjk+uO9UetM5F
rK8zBeFcW2ZA+qLq3E/dMnAdxygbkwjnqUl+kmC4IZ0bTyDjD+J3SJVNXBt9vqsE
GzUvrTFOiRRuqH64k2vsrVQL7QGCPQtospmSpHLfY19nFBGtM0dscRvTGxSt0cWq
aomo8dMnWP5fsU9SxyNLcm6DXerPbSnvPPtGjHVA/j3N2XIazU1+nfyCUzt04VSf
Sd96QPr6AAF08YiAnB6j7ATydGrbeDIUcvjNmmNKBmHokio/tZBsdxErpIPu4TBl
aadvmXevqsiq0Zod0YlUIKUcpSrz4HJP5CdOYFT57RHvACm1hWEce/8wfVjXwXFn
CEHH2x4CNH1es7+yI8f9lLFu4BbTjyzw9uxjuyGpIZK6/iWM5JhKDIM39r5Wu5ji
D8OFP2q4Raf90JUpnQdZi+tcPYHA9V9g4sROo2OCWXDNojoIfY9CySZithzA0Ifs
vIKxXZYx7KhgIE6lRK9s9jglH3Z8qIwr96OzLthSjslWSkUHWqqV0IPVWstvb0h3
ElKzt8elH8LMtFWQDXmh9aElGIaKsnodEaF+ch0/eIoi6xOD+M0=
=FHcD
-----END PGP SIGNATURE-----

--ErUevg9i5Um2IOcr--

