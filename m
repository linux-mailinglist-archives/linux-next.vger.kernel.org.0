Return-Path: <linux-next+bounces-6755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F96AB5FC8
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 01:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596ED860C1B
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 23:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0883A1EB19B;
	Tue, 13 May 2025 23:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GabFUoqT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEFE136337;
	Tue, 13 May 2025 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177777; cv=none; b=rsBrtGdV8iBYccRS5+rtrKJ7dIsydL2iNb7I1hr7FUvrulD3taG0m5/PvH6wHAiCOEg98zzmBx/hJZVfTkrxZgWgPrAyB9RyM2cVfzTfFJwkT21876FwFxw8sqZxGdR98N1+5ykz03+4KcZy7TzROqMLtuDPo7AxvjZlR9j+C+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177777; c=relaxed/simple;
	bh=0uUSQkAKe1c8c9K4WhFW8meHssUZMjO6h9KlXfj/3pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNmj2mQpdmIDWWpzPE5hsuMT2aeME5OYlO3d9M1fpT+/cyrcEhpkANmoK3ns6MkIBmhfULw8mG2YvU3yQvLcPZ+Qztvw+GYQnCmIZZUNkI3SlO6VvKkfCsbnu0kE2kn7vQaJFsc4gyQYOm+RTTnlQvF4OqhzRiM45UoseB8egho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GabFUoqT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a9718de94so5968439a91.0;
        Tue, 13 May 2025 16:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747177776; x=1747782576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+mxhHcPr+TvZqZf0aVFhNrCdir+u6TUHiL5kEkrMXg=;
        b=GabFUoqTpJ8XvPok34AwfZhkz9GzAlHuOsG02XC/8bnPa6kA6zTbTINjj8pz4K4Qrg
         1mHH02pq6IQlQIWm9npWqagfetb5jFR53ZuxcolZlTNY7/Ef4A8T/k6bosWqJYqzQZNF
         py2geUB2tYKbsN0SheUB9cpCsRoJhcqflw3JRUm3Cg33cVViY5iqP1FeOdPH3m7AXfF8
         lxo5WyAlG8kYwh3yMd540kLqJwwjbFlQiIZNzy55OMICGJFoDbnRxMZHVGfmkanODuy9
         sE4yaTQYufkDVjqXDZVWrLHpJUBs3DQlf/C5ACFwIutwn/ZcfgVjTY+X1Iw85Omf1fdT
         J5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747177776; x=1747782576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+mxhHcPr+TvZqZf0aVFhNrCdir+u6TUHiL5kEkrMXg=;
        b=Y8oYJYCaLPC/idQ1Fu7ywdrGRvNNgGqe1SOt7rUEFzqoeFwUTI5u+2KORvYqjQx5LQ
         j+bGsA041l/wpLvoo0/5oCLAYj5glOSvOLXfzJAcRBerkuU3qOZlcUMW1lkyQcDkpdHL
         asSQK5ovD8wXWwJbIGhJuMQUs0I4Fbu/q+8qzPawoQpC0i9n9zzsLlyzeZMo+nLDdt17
         KTU839oLyND2mNz6DFKCLZWCGbrTs5HJmPVWaYjw9STCui31+0W3YHhSlwMMYQ9BdRgL
         pI9AIy5t3QlzYMEAigDSkVzhQde8Rddayi3XjSzcs5EhgDP/Im83rMlhgkk9SM++RAPx
         Abyg==
X-Forwarded-Encrypted: i=1; AJvYcCUs8o5LlhyoTj3AtiiymgNDAmhTrf0IAykppyedzVxHipSafaxVL80r+gP/JfaZuWVGLYEUaX9QrvdiC3g=@vger.kernel.org, AJvYcCVNwMZ26vzGqUHMSPUUTSAEOdjYV7K34mB9yZSzIQaUjEreDhUi0D7UoeIEs7vTtgSuGYzqyfEqzDbx2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDV2aXGIJwRhDAx6WbSPbsekX5rqfMLdTBOIdIaLVL74MQYuOI
	1mp5tIJInQ51F+koB8Pm4VKd6mmiweUDYZm0skG/TF4nuD8rG041
X-Gm-Gg: ASbGncsPV6N3LcUPVZ3MzCoB2QJUbow/3X5RzVciZP10NCTSvb7OBW8giC6CzlZhL6Y
	hLdQKuSlCR9avoXJAgkYEM3gzRsp/l9BuB2pStADB7iS2mKglJHxJWQSuy6kJJHk8SAnR25MMHR
	N8c/yBTA5zhmmsW/kUA0ygSLGBZk+hBwB0IBMQHm5AlqyPC2dZdyHbM+XaDiDm2KGTruiWT8t47
	dvz5PBjX0AwNjXB1tz0bflQxZIFcyTw6t/mGuoqF46U3CQjGYcQD1ZLx41W3BL9AutRE9KeHg95
	VMBvtoTVgTgXEXE19Yh0r13myoVQZZMB68yXd0waHROq4BJZ/h8=
X-Google-Smtp-Source: AGHT+IHrL8Z6RQnvzJXvyvY25K4u5b1f4H/BpBsbC5LnWuYDIGCWgBMC9bTkCAR9RY+qKFYik25qsw==
X-Received: by 2002:a17:90a:d650:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-30e2e5d6114mr1878597a91.5.1747177775412;
        Tue, 13 May 2025 16:09:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3349d50bsm147145a91.45.2025.05.13.16.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 16:09:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 41F1342439C7; Wed, 14 May 2025 06:09:32 +0700 (WIB)
Date: Wed, 14 May 2025 06:09:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <aCPRLHg46GP0_Pse@archie.me>
References: <20250513154845.7c03dbe2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X6G5xsf+9iNdz6KE"
Content-Disposition: inline
In-Reply-To: <20250513154845.7c03dbe2@canb.auug.org.au>


--X6G5xsf+9iNdz6KE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 03:48:45PM +1000, Stephen Rothwell wrote:
> diff --cc Documentation/admin-guide/hw-vuln/index.rst
> index ce296b8430fc,cf1511145927..000000000000
> --- a/Documentation/admin-guide/hw-vuln/index.rst
> +++ b/Documentation/admin-guide/hw-vuln/index.rst
> @@@ -23,4 -23,4 +23,5 @@@ are configurable at compile, boot or ru
>      gather_data_sampling
>      reg-file-data-sampling
>      rsb
>  +   indirect-target-selection
> +    old_microcode

The resolution LGTM.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--X6G5xsf+9iNdz6KE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCPRJgAKCRD2uYlJVVFO
o0uKAP4oOyW1A027V6px2VPwT/NHhkeU4xenNDfDE4URAiFyFwD/aI8SjAi5pyLL
ByS/ClAeKhO61K5FIyGT89v0Icm3Vw8=
=hfum
-----END PGP SIGNATURE-----

--X6G5xsf+9iNdz6KE--

