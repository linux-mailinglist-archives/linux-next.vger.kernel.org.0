Return-Path: <linux-next+bounces-28-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A17F4544
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 13:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280931F21ABB
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79900208A8;
	Wed, 22 Nov 2023 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtNaBKsD"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF971A4
	for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700654452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jmfy3kCd2YUjxLnPRJpQFmmKZOJhEA2YCr/PvLEba18=;
	b=HtNaBKsDCL+SxeOc8QDMLW9iFlb/Du/Q9fHukw6lddBRjtXqM9kDfEBH7FbfU6aTTZ7Q7L
	sNEdyQXVk4sO5KuTAYtGt0LliBHF0JVhFZQiN7MIsr4cYsIKbAyH/iBafLhs/p2BzmWZQC
	OrjbshTSu8VOOV0l+vPs+lu2XuEOL0M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-P_OHGsepMUWujNRSg07QOg-1; Wed, 22 Nov 2023 07:00:50 -0500
X-MC-Unique: P_OHGsepMUWujNRSg07QOg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-332cb492d0aso1410827f8f.2
        for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 04:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654449; x=1701259249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jmfy3kCd2YUjxLnPRJpQFmmKZOJhEA2YCr/PvLEba18=;
        b=lpKJqy7zcoZSRw5WENfov7+1R1uz9P8YILSjsKMZcMXwIJe/aP3OdS2pps44LXraSv
         ffDZx98E/LoX7RrRcqLjpLH7YPambp8PhP8iCNdlAr9bKOBxezL2/vBckjuLz/ZikleT
         B6aZ8+iNxBH00mlYqaZCxhiC9MuP71K/9GXuMQ2zEO33yBtol8feRkqUtGIp5HIRdXdB
         MK3U5qdmCSGKC22lSF8OiPeMs9Iqbmgcejv6F0AlDjxey9XEhH+AW+fJhf0QgLTzbDOe
         7U3znez8KKrH0zpkPyzJJUXHQNKYjmPpRl/FArN49mVucjQjFtn1ODaJSPKD9pNR/iya
         JCHg==
X-Gm-Message-State: AOJu0YyXNthm9oaaRtxsh2MM8vLDQpUgv6OUbSJDraA2/khvWDzP3gXm
	LSd2DHG9IeaHMiZr5ddlWOopqvIyXV0EqM3q9iV9r7JCRcfs2GHvpGnnJQA0ynhzbX56rZlbfhA
	W043q5sX4w+l2JFklHv9AXg==
X-Received: by 2002:a05:6000:2c4:b0:332:cea5:66a4 with SMTP id o4-20020a05600002c400b00332cea566a4mr1565034wry.14.1700654449075;
        Wed, 22 Nov 2023 04:00:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcFf9DArrMf2qdlqNINZRMkLt+TpvsA5AzhchHcWi/XwSyj1G1RQEK9q6d97uQg4unQtT1cg==
X-Received: by 2002:a05:6000:2c4:b0:332:cea5:66a4 with SMTP id o4-20020a05600002c400b00332cea566a4mr1565013wry.14.1700654448710;
        Wed, 22 Nov 2023 04:00:48 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id e8-20020adfe7c8000000b00332cc24a59bsm5895913wrn.109.2023.11.22.04.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:00:48 -0800 (PST)
Date: Wed, 22 Nov 2023 13:00:47 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <zuz7zpcjfqzeymfrn53tbhcsem5abqh2l4vcaqkxo5wbgoc742@bnxnkek3wv6t>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
 <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
 <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nrm7sdlmqzqflhqa"
Content-Disposition: inline
In-Reply-To: <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>


--nrm7sdlmqzqflhqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luben,

On Thu, Nov 16, 2023 at 09:27:58AM +0100, Daniel Vetter wrote:
> On Thu, Nov 16, 2023 at 09:11:43AM +0100, Maxime Ripard wrote:
> > On Tue, Nov 14, 2023 at 06:46:21PM -0500, Luben Tuikov wrote:
> > > On 2023-11-13 22:08, Stephen Rothwell wrote:
> > > > BTW, cherry picking commits does not avoid conflicts - in fact it c=
an
> > > > cause conflicts if there are further changes to the files affected =
by
> > > > the cherry picked commit in either the tree/branch the commit was
> > > > cheery picked from or the destination tree/branch (I have to deal w=
ith
> > > > these all the time when merging the drm trees in linux-next).  Much
> > > > better is to cross merge the branches so that the patch only appears
> > > > once or have a shared branches that are merged by any other branch =
that
> > > > needs the changes.
> > > >=20
> > > > I understand that things are not done like this in the drm trees :-(
> > >=20
> > > Hi Stephen,
> > >=20
> > > Thank you for the clarification--understood. I'll be more careful in =
the future.
> > > Thanks again! :-)
> >=20
> > In this case, the best thing to do would indeed have been to ask the
> > drm-misc maintainers to merge drm-misc-fixes into drm-misc-next.
> >=20
> > We're doing that all the time, but we're not ubiquitous so you need to
> > ask us :)
> >=20
> > Also, dim should have caught that when you pushed the branch. Did you
> > use it?
>=20
> Yeah dim must be used, exactly to avoid these issues. Both for applying
> patches (so not git am directly, or cherry-picking from your own
> development branch), and for pushing. The latter is even checked for by
> the server (dim sets a special push flag which is very long and contains a
> very clear warning if you bypass it).
>=20
> If dim was used, this would be a bug in the dim script that we need to
> fix.

It would be very useful for you to explain what happened here so we
improve the tooling or doc and can try to make sure it doesn't happen
again

Maxime

--nrm7sdlmqzqflhqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZV3tbwAKCRDj7w1vZxhR
xZmuAQDIFQZAPbTq+2X7+yuDLwFD1dPxqrGxTfYDLsC4QYSg1QD/XcyAWTymltT1
jbncyhmu0xFrScTXeF7DeKzN3uuQ+wg=
=VQ9e
-----END PGP SIGNATURE-----

--nrm7sdlmqzqflhqa--


