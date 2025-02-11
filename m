Return-Path: <linux-next+bounces-5409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587DA3020E
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 04:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287E53ADCAA
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 03:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AA0433C0;
	Tue, 11 Feb 2025 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbIOWQpS"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CB26BD8B
	for <linux-next@vger.kernel.org>; Tue, 11 Feb 2025 03:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739243722; cv=none; b=GzUMuRl1eyaskXtdR8sXGTC6T1BtgrEsY/D9btBIzJRQdolSXxjgX85+7Kghar2ToKm3GHq+0IRR7eQaJlPxLpgtvEp7puxVYAu9LkAr0V1iTb4/EV4CYvNRSo4/MNoJQZrU+TcPxZw/0joRXmS1bL5M7QDVkAcJdDTBfsO9NC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739243722; c=relaxed/simple;
	bh=HA0eEC7kOG1cHWJvDtJcCnKolNpI4DxYE1BApqVuX5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Spq0yGNtWA5vX+a9CJ8zZYRnTDCNmWRdswPgJ+H1tDiOfD634IzAeDCKAlqMSqthrCMR5B3W6Q9rMN/pFMIBIHpxUXxxll2OoOK1YTz3wlwJQptMC1TuOugrceU7q4kLDNGi3dqSaDnxYPHVhq7mohaoM9Q/C9aZEBfhatlgGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbIOWQpS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739243719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Ivl2hUzrsAFBlV631jaucRgQ8R5hnE19aUzjr9fLE=;
	b=QbIOWQpS5wzsMT3OUIjn0FEPQGvi5e22cnXeA2ZMuUgIL5RkSrb9VFNExeqeNoDyL1Zqc1
	hTSwGBZNDlJ2FB40uVrZVTu18d2FNiDlYqOG74FivUJdotL6ti8bolL2MVTslrfSzgEkIe
	WwTmjgL3+Ha71EUaVzUemV9rxKrxokk=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-2qOh-nwCOxqVgcoFirw6JA-1; Mon, 10 Feb 2025 22:15:17 -0500
X-MC-Unique: 2qOh-nwCOxqVgcoFirw6JA-1
X-Mimecast-MFC-AGG-ID: 2qOh-nwCOxqVgcoFirw6JA
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2a8e3905c56so1954669fac.2
        for <linux-next@vger.kernel.org>; Mon, 10 Feb 2025 19:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739243717; x=1739848517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ivl2hUzrsAFBlV631jaucRgQ8R5hnE19aUzjr9fLE=;
        b=Jb+CnXu5YzIC/kW9kqVujfGJYnyjDxv48eIVrlKAWtmoj5h+cRlwKiiMS3bwOLn0MN
         mfBaG969yqtcWI+48flNu4XXwSe59osh7oJEMKhJe+jF7TpO7Mw1P9zt/Yq2XqU30tn0
         F7RYyqWvv5l7rabzp1716T9VxLjNVfXM9JZpRHutRCBNiDlFD4VTrysk3kPs3ZaAHzdS
         cmnioNBpxmNLJI22EoR7YEbHE5m7OTv+IJaaDoXiLk6RmI7Sw8XkqAJwl3qJa3V1Eg9x
         WM1INoA57xM4ARAM20AW7g4UQTgTxqwhwoO5H3JlQunjr26hadHFficLuJm3mRN/norh
         YmCA==
X-Forwarded-Encrypted: i=1; AJvYcCWKxEQmtE4Ill7pkpVZ4lqt43ih8z3ce3oFewTu5nPrkU7+ugucPAoRzCAFdTloueeJhvc2eXI0fjBF@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMv9eLb9tDnH1FWGz9Yh1ViM+VbyG4cJMku1ZcvzwvgCNhN6f
	hwV8vUEd43Bn7+1WLhdTwYU2ytekmGOWHbrmj2YKVOFNX9myOHauHAndVAHhDzR41kLjrSyZziE
	TDNrl8H4uqkGDZ/DaWKhGcgOPlMK6TL4+aq6anv0DiBpjBQL4iNNLXGsky6xzTDBBFw/4TvJbnt
	m+NIcj5Acg4i5OxHE6lpgg2UXhTbu+Hrs3Eg==
X-Gm-Gg: ASbGncsbd/pYakUXRBqTUS50cVXpEX+t8zgEmhN0qLVHaHai9fv35ZD1czx/kli8Un6
	lEwxfqcp5cX1ztlGQ79cyyynXoR6l87btFuYZaTVuNV9yhQRxbmPLL8H7BXCaHQ==
X-Received: by 2002:a05:6870:80d1:b0:29d:c6ef:cf1d with SMTP id 586e51a60fabf-2b83eba549amr9756679fac.7.1739243716924;
        Mon, 10 Feb 2025 19:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpeDE1nUfGm5pbX9Bj+ov+VzBebcDC/RED+dVFXtD78QPFmYvAX5E7sdpCS+436MdM2PtX5bHZ2CPhlreAWgw=
X-Received: by 2002:a05:6870:80d1:b0:29d:c6ef:cf1d with SMTP id
 586e51a60fabf-2b83eba549amr9756668fac.7.1739243716705; Mon, 10 Feb 2025
 19:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210104347.3d291afb@canb.auug.org.au> <64504o9q-5os6-79p3-o18s-5pn6q9s0q6n7@xreary.bet>
In-Reply-To: <64504o9q-5os6-79p3-o18s-5pn6q9s0q6n7@xreary.bet>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 11 Feb 2025 11:15:05 +0800
X-Gm-Features: AWEUYZnXY_mke1ik49Wr00glsp46UMJhPBgjYvzoEDy_WKISPe8kRoWnawcarDk
Message-ID: <CAEth8oGPimtR8TmQrODtExedLdvpCYzgynOiynBUU1jC4B4jvg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the hid tree
To: Jiri Kosina <jikos@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Tue, Feb 11, 2025 at 6:07=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 10 Feb 2025, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > After merging the hid tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.=
ko] undefined!
> > ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hi=
d/hid-lg-g15.ko] undefined!
> >
> > Caused by commit
> >
> >   a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")
> >
> > # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> >
> > I have used the hid tree from next-20250207 for today.
>
> Indeed, this was reported by 0day bot as well.
>
> Kate, are you planning to send a fix please?

Yes.
It is a dependency issue in Kconfig.
Since the LED multicolour APIs are used, I'll add an
LEDS_CLASS_MULTICOLOR dependency to HID_LOGITECH.

Thank you :)

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20
BR,
Kate


