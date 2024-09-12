Return-Path: <linux-next+bounces-3802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2616976DCF
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 17:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999272824D8
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 15:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BCA126BF9;
	Thu, 12 Sep 2024 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="ADnssp9F"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEEC44C8F;
	Thu, 12 Sep 2024 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155166; cv=pass; b=DqT3Tvus+ClDEbP395QOGJtS9lU14HWNsPQ+u1bUGJX57JwggW4lBH8ry8y+n6nRK66WEcfYvciq8yMjNRjE5mWfNyz09dvvkXXkky7Q8Al6zyrVF5kEQVsbyDrutaZ8VL7DRO3KhZFbQZ6T6ldcnQj85WWUGZZGBwmzKSEleA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155166; c=relaxed/simple;
	bh=YV9YcH/288vAjtNfsh/90bu+74L4xPu9n7Huwp4eayU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5apPPptgdrrHAtNKkQdu9ynazAyG3SxXWdEAHmTl8Ipx+/h8LdNmSYBfVwViqsFzbsuZDry16z/+dVGHeqJyUyqGVa+YRHsxHJBFoXey9wBx/02QPanzWVqEuXA7CXk+dtiJALYLD3zznRu4iGWTNV4s5ZjpWmCRIJW6KIOIp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=ADnssp9F; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726155160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kscO4jdLhxvHd6mk64ppAKG54LVWJIwn5WsMtgRzjyamuKm+0ixWqlJdImjL5Y2E3kOyC5nFaCqp/T2BvQjPErnu7W65niRQNRdmwv3VOE3PFgAesnRDnGMg1bkgb/tmcpGiIt7FQ8EK6bUDh9uFkMKmcfjVIK/oiU31ylMLpas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726155160; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YV9YcH/288vAjtNfsh/90bu+74L4xPu9n7Huwp4eayU=; 
	b=eWtSmILYgIo+nqXPJxUq4g4kJE3pz/8ce3XD0sUY4Wn5lg3KR3oeVGe0Eu09XPt+XVs2DbgnvuAs1F9Uj7/CtIllWj/jTfvkUjzvCABKll07oOeHRIB+t81GjXnIhTDnWy5KbDbS847cZrO/PajaNPxylkGNsNllD7c2N/Ci6wE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726155160;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YV9YcH/288vAjtNfsh/90bu+74L4xPu9n7Huwp4eayU=;
	b=ADnssp9F6hO1o9podZiITeDZ9Qd/+EOSwCCU3vZEPl4g5bNaOQHgcvNs7YSwdfm3
	Uv/vb2YBiN5rKu1GiQZ4p2wVYUVJrCInIKCZPPP82vKhkVtzn8UvKTHE7qBwI5MMOJ3
	HeCE7zoOzXQm9XVlgqsYLwf/B76mgETSYGMN2QVU=
Received: by mx.zohomail.com with SMTPS id 1726155158140886.7487074473904;
	Thu, 12 Sep 2024 08:32:38 -0700 (PDT)
Message-ID: <a5f3b6c7029c9d431e28a8ba4ed886a1cf67fff9.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
From: Martyn Welch <martyn.welch@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Stephen Rothwell
	 <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier	
 <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, Hari Nagalla	
 <hnagalla@ti.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>, arnd@kernel.org
Date: Thu, 12 Sep 2024 16:32:34 +0100
In-Reply-To: <CABb+yY07P0zs6nT2CrZ+TnO+2XxZKYUfEjyRj2wwn+zAx9T0iQ@mail.gmail.com>
References: <20240822142603.3608a26d@canb.auug.org.au>
	 <20240828150900.7ffd7588@canb.auug.org.au>
	 <20240906183621.6c630b7f@canb.auug.org.au>
	 <12e1eda76baaa67109da3798b1b184b4a94531e6.camel@collabora.com>
	 <20240912183408.36acc6dd@canb.auug.org.au>
	 <CABb+yY07P0zs6nT2CrZ+TnO+2XxZKYUfEjyRj2wwn+zAx9T0iQ@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2024-09-12 at 09:15 -0500, Jassi Brar wrote:
> On Thu, Sep 12, 2024 at 3:34=E2=80=AFAM Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >=20
> > Hi all,
> >=20
> > On Fri, 06 Sep 2024 09:58:23 +0100 Martyn Welch
> > <martyn.welch@collabora.com> wrote:
> > >=20
> > > On Fri, 2024-09-06 at 18:36 +1000, Stephen Rothwell wrote:
> > > >=20
> > > > On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell
> > > > <sfr@canb.auug.org.au> wrote:
> > > > >=20
> > > > > On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell
> > > > > <sfr@canb.auug.org.au> wrote:
> > > > > >=20
> > > > > > After merging the rpmsg tree, today's linux-next build
> > > > > > (x86_64
> > > > > > allmodconfig) produced this warning:
> > > > > >=20
> > > > > > WARNING: unmet direct dependencies detected for
> > > > > > OMAP2PLUS_MBOX
> > > > > > =C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS ||
> > > > > > ARCH_K3)
> > > > > > =C2=A0 Selected by [m]:
> > > > > > =C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (AR=
CH_K3
> > > > > > || COMPILE_TEST [=3Dy])
> > > > > >=20
> > > > > > Probably introduced by commit
> > > > > >=20
> > > > > > =C2=A0 ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc drive=
r
> > > > > > for M4F subsystem")
> > > > >=20
> > > > > I am still seeing this warning.
> > > >=20
> > > > I am still getting this warning.
> > >=20
> > > I believe this is the required fix, but I believe it's waiting
> > > for
> > > review/merging:
> > >=20
> > > https://lore.kernel.org/all/010201919d8b298f-dd1585dd-7c4d-4865-9483-=
ff6cd7399a90-000000@eu-west-1.amazonses.com/
> >=20
> > I am still getting this warning.
> >=20
> =C2=A0This
> https://lore.kernel.org/lkml/20240909203825.1666947-1-arnd@kernel.org/T/#=
u
> =C2=A0 seems like a more complete solution.
>=20
> I am ok if it goes through TI or another tree.
>=20
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>


That solution works for me.

Martyn

