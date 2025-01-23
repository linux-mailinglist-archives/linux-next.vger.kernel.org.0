Return-Path: <linux-next+bounces-5301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E1A19BC5
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 01:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCEFD3A82A0
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 00:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF7F9460;
	Thu, 23 Jan 2025 00:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2PiRX50"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C45849C;
	Thu, 23 Jan 2025 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737592076; cv=none; b=nRpeym7Fx8AksEO2Nda1l5KcLCeLebwnBbBdjIP9ckkHTagDbwKpdx1dOJiohzm14xJt3QxB3mvlerQtDASDtO7wIPOwL9nJddp9RvHzK6skIY9SSMEZDMsBj+ISalX/O9y6VZTeFRZIT+vCsl38bVX2LBNwIxZ94r2saafYP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737592076; c=relaxed/simple;
	bh=P1QlfT/atXuQxuOLuOydbEL5pw5YjBouTf3uNSWNkZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyZ9B/7nrUUcM/MaChNXPrShCgClYZbv+ES9FdRRHiNXLl4rQx0QMoQwx1HrFE5rCr3R3V3fmhnxBhF5j7BrZtTVQb3LBKjo980r+NKmhFtpeZ2xDoToRzJbz9PzFy/qGqrnZ5O+D4b2WOUIbdar5IcDzadZQxej4Ne5PnnYYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2PiRX50; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso4902765ad.0;
        Wed, 22 Jan 2025 16:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737592074; x=1738196874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WHi/JYFD3EzJEZRlZs0PVoRsk43gGGHLDgIMkHR904=;
        b=I2PiRX50QJckqOAC2Q6inXuR0vKc8ki9lDej9WvbdWhhEseUaDbLNNiaKAWJJ4jOWh
         tmYbQYHG1LwkBVKcEAGGqiXBpJYxQNburty51qSQnrJIV8VdJ2Ma8HTUOdXKJiRdV5MY
         2dR7dUU1bPomSYObRoieua7SV5JyI+tCG6bZb9/JTBy7gLm2/LW5O6oT65ZVjcUUGfTS
         QauC+w/udcbWucilMLQBA2Aa+YOtMlOfBtH1iQ1r59BOmRKzD66l5Z1r2KaaTO0LDaHB
         iIqpCifCFG/H7CWjLL9myhUEm7bhIQNsF5S5SxnZTbIxY7xyNxhPC6bRkLspPv6R99Xk
         ucvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737592074; x=1738196874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WHi/JYFD3EzJEZRlZs0PVoRsk43gGGHLDgIMkHR904=;
        b=uOyDxHGDV3GyArITrJ9Egh+er8mSUvn0EBkIEdcoeUo36nkF0LnMdTrI45+P6VW49C
         bZL9t4ozFSk9U6+yw1rtW5yEhvjAAJ9Bhu1UBhQLhrU2r8ECWyl0qOA47oazgZtBru25
         ngYJ9RlpnPaG0Ipw3CLbUBJaLJ4VEwQq7pCbK+oCnLMrXuwaf3683Vtu+W1oGl3zIMCy
         eFSs+JDexwyGXHxB32fglEeDprkJUub8sP6qMRqZh8vdZ/eNGaFeT24DTusr3nd7rMuV
         PFR1boW26BmJSYPFfZ5pFMicAMysaUzuu55JKGUB3Q074BLK6OB0/p35lyyYnCJWnSbw
         fA4g==
X-Forwarded-Encrypted: i=1; AJvYcCU3efQuovk6TelfZjWMqpTq6SbLdkpxPKgn2odeB1FhTKpWlj4APYyYlX3mV5dUvbfkW8Fgz5fr/E0=@vger.kernel.org, AJvYcCVfPXhBuw47X5Bbx1nw5vbUaOSg3zEnYwChmxCpubZWqx8K52Cf4yoDsVmUZAbhXF+GnNHmFGJbYHO//KS6@vger.kernel.org, AJvYcCVtVMsF/1dLBlJlBHgJ5hCYYyHd8/61QOnTH6JiVxy5waly/MvAw7A5E7riv4176tR23wbfG5uUuGYKxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNRGo3eGJAmhx6BbqE82M+GhHQHz3N+/ofNkQp0TFpZFZaZfe
	4yWSdmLRcPi+0k9FggO1dbvLGguMY+Bx1/AXM+qtmOnH7umVW07j9wu35w==
X-Gm-Gg: ASbGncsWFVrq8k8oW8wptgQ/Nch6kCTS4umA/TWVrfaZiBRazSAPQezeJ/Aeo2IaiGc
	cu3gmMAC2dLR9m4ogi1byUe7Fy23nqpQG3P7v+I8JmCGMXZ/uhXVCjO0Mc/GmcLuCTD52W8B6jd
	eZ2+LzZIYjlsqy0gcBZSn+ab0oSqtOTCtXjarGLh94fv6+reBHUHLN0w6JzzSB8kzVt2Gev2JGZ
	QvZufJXC3gyoCg+7ipIBR0a2mVzAPplEqme4PFWjXAYJwd+rjApUrSRheot2iVWzTYaDQ==
X-Google-Smtp-Source: AGHT+IF9W/lfbYguerC3Ji+62X4tWnWJEbro41Fc64DOb8G/a68R6PYdI7AnmVVrQ0CB0eRsFrYNsg==
X-Received: by 2002:a17:902:ea10:b0:215:b18d:ca with SMTP id d9443c01a7336-21d993b9408mr19100075ad.18.1737592073733;
        Wed, 22 Jan 2025 16:27:53 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9ad4sm101577935ad.78.2025.01.22.16.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 16:27:52 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 989EC4208FBF; Thu, 23 Jan 2025 07:27:49 +0700 (WIB)
Date: Thu, 23 Jan 2025 07:27:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, sfr@canb.auug.org.au
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, mchehab+samsung@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the origin tree
Message-ID: <Z5GNBaSDofq-pI_T@archie.me>
References: <20250122170335.148a23b0@canb.auug.org.au>
 <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>
 <Z5D1FzkmODr7YC8I@archie.me>
 <1518fd0f-4b8e-406a-bd60-878c0c522bde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xxgufiOCQJoM4b+G"
Content-Disposition: inline
In-Reply-To: <1518fd0f-4b8e-406a-bd60-878c0c522bde@gmail.com>


--xxgufiOCQJoM4b+G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:46:46PM +0900, Akira Yokosawa wrote:
> Bagas Sanjaya wrote:
> > On Wed, Jan 22, 2025 at 07:00:43PM +0900, Akira Yokosawa wrote:
> >> [+CC: linux-doc]
> >>
> >> Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Today's linux-next build (htmldocs) produced this warning:
> >>>
> >>> Documentation/power/video.rst:213: WARNING: Footnote [#] is not refer=
enced. [ref.footnote]
> >>>
> >>> This warning has presumably been there for a long time.
> >>>
> >>> I don't know what causes it - maybe it needs a space before the openi=
ng
> >>> bracket?
> >>
> >> Stephen, fhve you upgraded your Sphinx recently?
> >>
> >> In "Bugs Fixed" section of Sphinx 8.1.0 changelog [1], there is an ite=
m which
> >> reads:
> >>
> >>     - #12730: The UnreferencedFootnotesDetector transform has been imp=
roved
> >>       to more consistently detect unreferenced footnotes. Note, the pr=
iority
> >>       of the transform has been changed from 200 to 622, so that it no=
w runs
> >>       after the docutils Footnotes resolution transform. Patch by Chri=
s Sewell.
> >>
> >> So the above warning is real and prior versions of Sphinx just can't f=
lag it.
> >>
> >> To silence it, you need to get rid of the unreferenced footnote, I gue=
ss.
> >=20
> > Hi Akira,
> >=20
> > I think the culprit [#f3] footnote (that triggers the warning) refers to
> > Toshiba Satellite P10-554 notebook, where s3_bios and s3_resume work on=
ly on
> > uniprocessor kernel. The proper fix will be probably adding a space bef=
ore
> > the footnote.
> >=20
>=20
> Ahh, you mean the referencing side of the footnote in that table.
>=20
> Yes, you are right. I was lazy and didn't look closely at that jumbo chan=
ge.
> Point taken!
>=20
> Thank you.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--xxgufiOCQJoM4b+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ5GNAQAKCRD2uYlJVVFO
o8qeAP4sdw4v2QFokDK11uwKe5pmFG/hURcPlnE14TWhPswioQD/Qj9AH6hQWNdR
vtmLL/dzJIz6m+lw02NWhDunPhnY/Qk=
=0wN9
-----END PGP SIGNATURE-----

--xxgufiOCQJoM4b+G--

