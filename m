Return-Path: <linux-next+bounces-8245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC470B508B7
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 00:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F973ABADF
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 22:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD216265CBB;
	Tue,  9 Sep 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAGgNJlW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53451DDC33;
	Tue,  9 Sep 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757455816; cv=none; b=XRnE4J1j311MaL6sdKjUXW47Le46mkoQTiNf7UnNgkQL0PMDTNqS7vQte8cEj9VTiG+Q0QXxTXMXe1AVHClcCrfzXnkUQm2KwFb/q4nHezcWqoteoOZldIAc9QZg2wGqsMyapUrJUpqhJQRzqQ6PTgiyMxOYZjwwvPYlBScPeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757455816; c=relaxed/simple;
	bh=wGnzp9rz/bafn3nZECaCQnKGysh656pdCdJqgpXqfFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdn+rEoagSXzzHWAlUI2HMMTRLKTNV1DYcATFfpIMxsTxQIYIVhikQw58Ol18rSaAE8V8HKcHD/PQl9v5cmZicf4vodY8/qjTj3LqYNr28mFWjVkkdKndqiGFGd/vE+DpbTaqzK812eUytf7uX0Qy7f+fjBBCIatf2yqT5HDXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAGgNJlW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA43C4AF0B;
	Tue,  9 Sep 2025 22:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757455816;
	bh=wGnzp9rz/bafn3nZECaCQnKGysh656pdCdJqgpXqfFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vAGgNJlW6cRXtE++a2OC7ND3wplPF+2YebqndWly+d7ifQu2a+YulMPK7wQay6g29
	 6hTAdcAPuEsv0QqTLs/CBXJjM3xge0ehiY3ya/Yu/CBg8mTdIQekofbHHWMC/jBlXM
	 Zfp4yVPidv8W84AIZfWRydlXEn4T5Lp9JOE5tQIXMIzQjrPkAoXNsMZsJTJKJfC2pZ
	 vS5l6QcCYvMZIKuqrXM0BmM1g16hVkbJ2bzIv7Ukigv7KaWl9LdaNRH0BGbQgyHWHR
	 6ayB9G+198DGvg5Wiqraobezbo3mlEKG7+5l0sEpgMgIQqm28ahq3cRGbb9NzC84Mz
	 92F6AHQGUDGzw==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-62189987b54so1791452eaf.3;
        Tue, 09 Sep 2025 15:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVR4CJoFNRBcy79RMArDLrnug4lnnFt6n1937ky4jotGsxYTG6VSFZmEgUKP+yLF+eBQiqeeRuKHDz2KXA=@vger.kernel.org, AJvYcCXs43cLpBtIGBuw9ycByPudwSCXSgligoKiBJqspmGlf8Ksjc+Vv1vvSH/eSgQvSIawZovkTHDHWNZldA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrTSWwJBSNU7cvfa+n3tDwqx6aCFWS5yskPk7Hq/9H2JfWQWc
	qdoc8mfmpJL84TgLY4Hl7Jy5xJZt0EMw8+ZuLixyfzc8q0pLbQ138LMPPu/SY0L4bxRi/JWu2Zc
	OzYHwUcpGFace8o5w7DgxDoKsTI+vnXI=
X-Google-Smtp-Source: AGHT+IEM8ntDLLY2copoQCXK05+MBuSWEn6ZZbBfjz1pjTQfuDLbS74UxYn+2XOsts1ndat3Y4GgL4Tsd4n7cHc17kk=
X-Received: by 2002:a05:6820:151a:b0:61e:78bb:ff15 with SMTP id
 006d021491bc7-62178a12d4dmr5940588eaf.1.1757455815669; Tue, 09 Sep 2025
 15:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908175135.4215c780@canb.auug.org.au> <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>
 <aMBZ4zTyMZLdQWJx@yury> <14358105.O9o76ZdvQC@workhorse>
In-Reply-To: <14358105.O9o76ZdvQC@workhorse>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Wed, 10 Sep 2025 07:09:37 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1ceu_C5QZ-v-dvTMiddaAK12z0gFnfbb-tt_n5f_fk1w@mail.gmail.com>
X-Gm-Features: Ac12FXxkoRwmHDfYolV-0qE7Z5vDVMnr5FGJZNrdcqoTsAuzEvQv-VvCfl3ShmU
Message-ID: <CAGTfZH1ceu_C5QZ-v-dvTMiddaAK12z0gFnfbb-tt_n5f_fk1w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bitmap tree with the devfreq tree
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 10, 2025 at 2:42=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 9 September 2025 18:46:27 Central European Summer Time Yury N=
orov wrote:
> > > > Dropping the bitmap tree changes of this driver is fine by me. I ca=
n
> > > > send a rebased patch of that for the next merge window to do the mo=
ve
> > > > from the driver's own macro to the shared macro. The functional
> > > > change in the devfreq tree is more important to get in.
> > >
> > > I think that you need to ask to drop your patch[1] on bitmap tree.
> > > [1] 414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_W=
M16 macro")
> >
> > So I did.
>
> Thanks! Chanwoo Choi, could you pick the DFI LPDDR5 change again
> on your side?

I applied again. Thanks.

>
> >
> > Nicolas, please make sure resending the dropped patch
> > rebased shortly after merge window closing. I'd like to schedule it
> > for -rc2.
>
> Will do. Thank you!
>
> Kind regards,
> Nicolas Frattaroli
>
> >
> > Thanks,
> > Yury
> >
> > > Before fixing this merge conflict, I'll drop the patches related to p=
atch[2].
> > > [2] 7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5=
")
> > >
> > > After resolving the merge conflict, I'll apply them again.
> > >
> >
>
>
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

