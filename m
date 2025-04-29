Return-Path: <linux-next+bounces-6439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27EAA108F
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 17:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6924B189D13E
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 15:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8784321ABA6;
	Tue, 29 Apr 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwCSOQuG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16145216386;
	Tue, 29 Apr 2025 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940826; cv=none; b=RRBq9lCp+uYL3qYDhgW9MV6MagTpT3v3y4Fkp8epd1BeS+7EsLchul1ItM71OW0ilznBgs0phG3v0eGDEICT/iKJp5E3NEzwq+3MLgBNGU1JRh8DP/ypH7NnLwUzVHi5oQpmZx03VOQOlGnnU9lvVLDvUUKojwWaBZiCPnnHhXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940826; c=relaxed/simple;
	bh=A+l+xI7Imok+VPDtns7qlBCebAAix1fE4zfWYe2kV2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAkO1Kzlg2a4BtCrXomW3qILH0So8L03cjMc5vl5k7ghPQJQDy6OsTCIeJKPF1fw4UVnk9Qry4NiCw2SyMa5zmjzwJvSFvcEXQH0JxXdYDzhbD4ChHxBM4B4xze21EHMjq4a8n8T5L21sbmMwDQJXTlrxYlpPcKILTsSpmTfDQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwCSOQuG; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0459668101so407052a12.2;
        Tue, 29 Apr 2025 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940823; x=1746545623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZIKiIlFR4DQeDOYxtwwQdiHDCHP+QL8sXp+cVkdBOU=;
        b=IwCSOQuG8dsGOLW396Z/52JxYX61bixG4DZ2ihJ+2DWnVTixS+6JzZ69Ya9UioGipm
         7pjO+m5VV6d13e+FTlMSa4Pr0ar2oMS4rkOM59pP4jY0JnTRFMjwESBiLZ+wTRiGhTyK
         cPvJUJDu9ynwq+J0BvcxJz4zx5vsOiG04urwXzHJOtjEpqNJMvH9D3tBQ+5zuhPDo+oJ
         Yuvdx7zZcAL9Lyz/UUVQODfPnx3b2sBkTqqdbwuarHQ8/mbYyFUrHkDBkOnY2MAg2G8v
         R9BZy3dfpQPXXWKxKJoENNd+O59tFUjORhzflt8oBttrnJDiQaI9S+8DU7xpqYBqczP2
         n5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940823; x=1746545623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZIKiIlFR4DQeDOYxtwwQdiHDCHP+QL8sXp+cVkdBOU=;
        b=JtAkxlPH/RANYs8K72Orbn1AWSsFcCvCTpx1EIpf0auOJO+oX82ULst+KY5O4Njmch
         U2Nc06RZHNrzVdAMT+Cu/HGq+1SxuFSGBoZSr7GDSj+Vrj/wTLHAcFaAmzlaDYxX3beZ
         ZLyxZSkwNi5tomh2Hqe4FY3uhvr8NIhCizzmiZMOSKfUZceBwPM09EFbPg8gwqOuNAjy
         UxkKM9dzGyahgW3dWW8UkH64fbwMojQU97atZRehz/HtGBLUZWnp3S17XUKX5rEKuaVE
         onEPe/fslZvQpj+NB/5uQzU60m/2vvWEXWocXPKSkAWP53+l6i/rX59pq8lz4pKJzPSv
         YvbA==
X-Forwarded-Encrypted: i=1; AJvYcCWmrVh/T4qiw8/zOrD5zFO86jNN5QiLoJ4ufoZFDddervkBzXL4HNskXQxmxGWjeM4Z2nekAePYFx0Pmvc=@vger.kernel.org, AJvYcCXNiYfVVZsCN34pRoaULwdL0zV4ju20S+AFiRYTkTmK1f8qfix1C0pcPOdNUQ2Sal/EafXouxqWP9b8JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvkvFzceWTOjvxWSqDSIUNVw2Gc43Nau7RqnJZGiDKppBJ38a
	gXK+gUa31Q9r/BWhHTbSAeEkdyCGHuqUkCxp5E8p9mRRq+UcXMeo8e+vKRo4SsEZSe0WCIEcUre
	SCSCbZClbu/uxey97dCkFCAfgPV/96Sg+JagbTg==
X-Gm-Gg: ASbGncvbIenBYm1qDOk2bXAMa0hUm8m0bTqhinU2M3q2VwVw4Wup3/Vqe/iz8Un/wNq
	mVflyd33RmxOMzcOP1hfMQLOIK1EWA9bHEUaoekQKbmWyheDgmJpHiMKmIkfGkQlr03AfhjOm8Z
	VB9G0wSU7gcazyp62pmB0xhmtPgq1RL5hK
X-Google-Smtp-Source: AGHT+IFjB+MW/kvKyLLyIFXEGRvt8nhF0yNYd8DjBFC2RtS6kaeAW1UsQcta96JBRJllwfrNaV8OrfyIUQVMAE2XXLA=
X-Received: by 2002:a17:90b:4acb:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30a2205ed8dmr2081705a91.1.1745940823331; Tue, 29 Apr 2025
 08:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tAJ0jyptJ0jLaRp9siDw8y2iw3S7GeuC05Uncum-qihlIKfCfEVhQbGNuTengQ0kWpnNp7OoTITxbEdf6nDTCw==@protonmail.internalid>
 <20250428203943.51dd39d5@canb.auug.org.au> <877c344gmp.fsf@kernel.org> <20250429174451.42a368af@canb.auug.org.au>
In-Reply-To: <20250429174451.42a368af@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 17:33:29 +0200
X-Gm-Features: ATxdqUF9NEpaCi69-Y7quv9-_Gz4JnLUBrCegSEmODyKPmFo2JEAcqd-gJA7Xxc
Message-ID: <CANiq72kSReDcMU=eezmgsREL5+1FSnq9_VuEd-8AtU86W6UoNA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 9:44=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I have applied that from today and it all builds fine.  Thanks.

It seems a couple spaces got removed when applying, so `rustfmtcheck`
fails in next-20250429.

Would it be possible to run `make ..... rustfmt` as a merge/build step?

Thanks!

Cheers,
Miguel

