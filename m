Return-Path: <linux-next+bounces-3648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984896EEAA
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A6D2887D7
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5251A2560;
	Fri,  6 Sep 2024 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="NyLjRkGc"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB11A2C29;
	Fri,  6 Sep 2024 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725613127; cv=pass; b=mt1xjZMqNaaUo35pNeJEHJg5G8Yx6TUK6/kdWkybcZ0TTql0RNolvt2ULD267nOgStF4yas/bmVpqz7ptKxgkg46Ib5ss02eUUFEUYEp1IjHxieB4z72c+yF86BGRhB+Ed7IEa29WzCTla8xNLw52bxzsiz7lnf83jogd2rJXlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725613127; c=relaxed/simple;
	bh=p+KoIXRIyIjj1StkbsebW9x25ZVTKh9V+6wAnb/8wLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aIsRURvYeWq3LqxfdpEailVlW4jroUQ7o2WVf6IaqeNnSWUuGeBDGkG+OdyIxYMT/Qjw+mojIztjjfo9ZxdTJzJz1uln87B3zWoo0PHkeyg2jWLDr/VfN1AOJGsYJmVkB2r0LNl6be4OaAvnzjp28fD32zE3xH2MTx+yShgr2UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=NyLjRkGc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725613107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BHPgv1cIenvaWI4iKG+NrFsxfGmPksVD4nsaz7Bq2BvArSOvx6ACFttzn0ATvDsINk0PvDLFU14hO1I5VJGMmUXV+i/0zESm2UJ3vBXkme0rF7OwuIYF+ef4yYWm+iF9hGb0ppUb2a3jdRf1zlmOkT9ieWnGVQZnsKecnhQ3hb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725613107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p+KoIXRIyIjj1StkbsebW9x25ZVTKh9V+6wAnb/8wLY=; 
	b=kffOJis5ywhRAhuZHD8XK6CVB6KDt6K2r1C1lnOKVQq7g1YFfYVvAMBl7H5OCm0ONSCL8yEYeb/I9sCwovUfeDXd853a3plBYl4Qkh9/BZXiCg13esYklYoekDTNkIak1QMi8MNoBru6U7PS/hdr91XkrEU0uXVjya8oYcemItw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725613107;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=p+KoIXRIyIjj1StkbsebW9x25ZVTKh9V+6wAnb/8wLY=;
	b=NyLjRkGcZLLET8nSk9fgiMfPwPJOM6e8dYsERPkDSVNeca20sac+xghysQUWGUCS
	PPkXBQo9v3Ez0OS73vyOBZxjc5zDUwjrSnEaZEG5tHJD5IXG/UmObN9H3aLAL/CnFXn
	JWMRO9MjvMMz+aReqliOqtosTBr8vwbQr1Z6Q01s=
Received: by mx.zohomail.com with SMTPS id 1725613106423856.8061901582163;
	Fri, 6 Sep 2024 01:58:26 -0700 (PDT)
Message-ID: <12e1eda76baaa67109da3798b1b184b4a94531e6.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
From: Martyn Welch <martyn.welch@collabora.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Andersson
	 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 06 Sep 2024 09:58:23 +0100
In-Reply-To: <20240906183621.6c630b7f@canb.auug.org.au>
References: <20240822142603.3608a26d@canb.auug.org.au>
		<20240828150900.7ffd7588@canb.auug.org.au>
	 <20240906183621.6c630b7f@canb.auug.org.au>
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

On Fri, 2024-09-06 at 18:36 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >=20
> > On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell
> > <sfr@canb.auug.org.au> wrote:
> > >=20
> > > After merging the rpmsg tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >=20
> > > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> > > =C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> > > =C2=A0 Selected by [m]:
> > > =C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 =
||
> > > COMPILE_TEST [=3Dy])
> > >=20
> > > Probably introduced by commit
> > >=20
> > > =C2=A0 ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for
> > > M4F subsystem")=C2=A0=20
> >=20
> > I am still seeing this warning.
>=20
> I am still getting this warning.
>=20

Hi Stephen,

I believe this is the required fix, but I believe it's waiting for
review/merging:

https://lore.kernel.org/all/010201919d8b298f-dd1585dd-7c4d-4865-9483-ff6cd7=
399a90-000000@eu-west-1.amazonses.com/

Martyn

