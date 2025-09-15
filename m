Return-Path: <linux-next+bounces-8314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A405BB58736
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290481AA85B0
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7802C0285;
	Mon, 15 Sep 2025 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSWRXPLD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB012C0273;
	Mon, 15 Sep 2025 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757974391; cv=none; b=aZF3XFZ1SP06B8O5q2C58lRV/fgLt2JydlU5jlpWbtNwQTnNakwXQJxqa4um2y4Gs7qm1b/53Tpy0ndM3tHRVBJdMEhCxyH49UW9irGtKsuEXSyJ4hGlhOu7rCCEcc8jrjuVZheOhEjKxvlgJ8E9oNrfGTSaluz8nWdWbP7f9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757974391; c=relaxed/simple;
	bh=QUw8qBq5X0fJdlqKntgs6fN2g/4Qxw5qdh9m2/Ep6BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEpcS+2jb2dqAjHir+rt6iQRkdfODk0OTJmNh53zNnCeNRjq71icwalNlV45gVPSNAcxVjAzIAmdGMTH40K5G1FZEqAYMeTEIKcLoWZxSZlisnhosbADveViPJvdY6o5o8CnrDk5wcOcnTm5V1aI41wIfEKpOTP77X1hpf0ukK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSWRXPLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA86C4CEF1;
	Mon, 15 Sep 2025 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757974390;
	bh=QUw8qBq5X0fJdlqKntgs6fN2g/4Qxw5qdh9m2/Ep6BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSWRXPLDGxr4Nag3XMwU5IgABMWQ7r3VMzwsiOE256EC906LR3lpLbUlEInpzXfDT
	 6bG4kIGDKOFxgWxtS+ieUyxjLGpcmZwgqpcu4UMkPD80dHgGyKUB67PatK0aW2Mtb5
	 RQh3GNF7KIKisRQf+cndYbhNjjSc7laYOmlH+/onaDTOEtGhWxgjU+zfPy9eEW4/DQ
	 QiSprAdhtyK2n1Le1Jy82edYTIwpaq105hrt+cw3aKNACYYCmBJTTAgS5tFdTpsACi
	 L8ghJPXud9E2B0ZE+KBOyhFMjOYciKhN912cvNeFD1tio/eQvwE7E/Ykl/cWM6fwsc
	 UfbeQaN6BsBzQ==
Date: Mon, 15 Sep 2025 23:13:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
	Kartik Rajput <kkartik@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <e70f4454-d0f5-4b3e-9751-730781f056f9@sirena.org.uk>
References: <aMhR9TJm5V5EqaoC@sirena.org.uk>
 <aMh_eKWqkuLODo2r@shikoro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVHMJg8yH3SQbV22"
Content-Disposition: inline
In-Reply-To: <aMh_eKWqkuLODo2r@shikoro>
X-Cookie: Use a pun, go to jail.


--SVHMJg8yH3SQbV22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 11:04:56PM +0200, Wolfram Sang wrote:

> > 's linux-next merge of the i2c tree got a conflict in:
> >=20
> >   Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> >=20
> > between commit:
> >=20
> >   804ebc2bdcc85 ("dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra2=
64 I2C")
> >=20
> > from the arm-soc tree and commit:

> ? Usually such patches go via I2C? And v6 was still under discussion? Do
> i miss something?

IIRC it came into arm-soc from Tegra but ICBW there.

--SVHMJg8yH3SQbV22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIj3EACgkQJNaLcl1U
h9Azlgf/XFikCn3g7A6UogjcKEU3xFVoeXmHFAraMcBe0o2bdASk/rEyTM2UVnXE
mXV/ytChmi4wYLjXNqEFWvFn1l38nnOOX2Gx+4XUg88pINlwNGTcNF7YdkHWJhNK
UlSLZXP3DekDTbeSbUnkhsCkJOeVmChLy/uvJthI1x5hF6nHXlXcpQxrJb361mUu
i+U8YFl4UF9UTN9skxOYMI+Cl1HXec11Hjp5p8e16qm/HzldH/8uPH/d4kX33vEr
Oj3/9Y6iWyt2xkF+weRdkrXlWixTNw7E2g2sFcOZnmmRCcXXcWv7lHfQlgucbrNZ
rV7i0/86wqYlqy9cXPbclGFqC4nWNQ==
=V+Ga
-----END PGP SIGNATURE-----

--SVHMJg8yH3SQbV22--

