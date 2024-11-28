Return-Path: <linux-next+bounces-4854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B39DB2E5
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 07:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A5E164BD5
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 06:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B4D13D53A;
	Thu, 28 Nov 2024 06:48:19 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848F213C836;
	Thu, 28 Nov 2024 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732776499; cv=none; b=m1Om57vfvfYbLSuut0YMTU1nYU9Zjm+3TytrYBoHLHmnrv9TAbA9wpj9R/WFS/7N//DcMIwnY17p4wu0XWtNr/q8QfHCBikxyxnZffHwLwgJ+H62dJUbKkHPyrNXy/uEzpDNX+Ej2LtRB+aZ9m+jF+TnSCT//wq9CcMlXZoyEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732776499; c=relaxed/simple;
	bh=gW802znw7yCiNjhzCYoWX42m+OHGOt22YMnVketZuXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6Mba/ixNQOZoJ0kbFytH0SPj289zA8JrhabSLiltd+mS8WFzqQVNfHwPHMOqw9yFbWfcRSMHLHPp4yWYhNlt/v3Ro4d+AgbPPMDtPygO9M2DkXGXTCLyOqP/Z/veFHcxDOWIrRkJWGgeO49ATkU2wg9h6TP6TOMOFyoI/vunxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (i5E861614.versanet.de [94.134.22.20])
	by pokefinder.org (Postfix) with ESMTPSA id CF421A42CCF;
	Thu, 28 Nov 2024 07:42:54 +0100 (CET)
Date: Thu, 28 Nov 2024 07:42:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the i2c tree
Message-ID: <Z0gQ7SOJZvSn2Osf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241128130748.3949c5eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B9sBARDz7sthjgRu"
Content-Disposition: inline
In-Reply-To: <20241128130748.3949c5eb@canb.auug.org.au>


--B9sBARDz7sthjgRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> drivers/of/base.c:661: warning: Function parameter or struct member 'prefix' not described in 'of_get_next_child_with_prefix'

A fix is already on the list. Will apply it later today.

Thanks!

--B9sBARDz7sthjgRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdIEOoACgkQFA3kzBSg
KbYN/A//S7r02jFpJRsZzfJOa6Hu8oUlPPLIL3X1XwaVeI/y6uUAxJ/FuDlZbxGk
QPqzzOG6RXgn9e3GCL0ulxr69dxbbcOuYsyX0e6vfrhlTRbfOoy9fvob2cMtAqkG
C2gNOZ6vqlQp2VtRGz1LajlPefLFV6dFgV+w/hwdP+S9drX94onSozMV/Jt/7rSz
/Pc9tBbL8Vd71KU395DeMXbNeRY9tKptUU3ON74nPrjR5dh+rHeqBAQPu9+oVSRE
ZHvAwk21vAmfDSKllJREyGcOnR3ambpFEVy9iArX3uYrtAR0S70484FeI+EcMzt/
5k0UCb8mFr7S6bOTxtBZmRFqz5f8aMOZ3E350bZ3ELZNjJ4VVlbIifM0THjrFVlE
svvZ8TePRlgDhYPx5UppzHtBlEZJW2UVMNSw6JnIMUmn+nilwHjUrubEUqLJzU/C
5kQoRuAMXzUtF9/Le3QEkTFpejoL2/Z7f/Dv/h0j1Sovrgf7lGtCbMcj6MQZWyT4
tpuy1w6Pz0b6FTB7cH/emfHll0RdirXcJwGUoHvEvMsrFeoN9EOpaeEjNqDHWDUq
rtrJnBTzviZ2HeHhnLp85vi7Fmm4mdEZMrGYqMJZ8RTnB5jiAtH5oEiV5Uy7jPNn
FF9WcUf7W9avdc62iiTGUkdoXdzUxFYv5kG7L4gP5/WjVdEGqV8=
=Xl4r
-----END PGP SIGNATURE-----

--B9sBARDz7sthjgRu--

