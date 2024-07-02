Return-Path: <linux-next+bounces-2794-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9591EF9C
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 08:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0305FB25923
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230F455C1A;
	Tue,  2 Jul 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfHWuJga"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214A7F47B
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903563; cv=none; b=DVyoYWdOBLrOcOni8mfbjEVzhTioQLVFsRZTkbf4AziZG0mz0c70d2InA/D+WSvESbTGz/gN/Bzwnh8rlz22Tpsv5V23zxyJC3E9hYynX6seB4uGu1cY+choE2dlAFc9Sq5NFWFXFlDkL8nFJwOs1zgDNjLbXKzdRQWki5/pJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903563; c=relaxed/simple;
	bh=Rd/RzdxgFoao+tjvS20h2iENS+qz6H0tKNh29qnyTTQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r71vRpxGrTMnjoHUj+ee+rH6kZbWfgPx8PgNdsWl+HYQkPi4dDn8Z1MS1by/rop11WY74GnbBqD76JGx3iOjWEEzaAg9Jg/heUMy22p+cbbw18+3UeQAUrNjIeJGW9PN01Q28gkcSfK5EJImt4lz4GL4N9shUkzujDMFBIrhY1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfHWuJga; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719903560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rd/RzdxgFoao+tjvS20h2iENS+qz6H0tKNh29qnyTTQ=;
	b=RfHWuJgan7JJKT75thSOctPDkKsFMxC+/OQz+E7KPsBxCxnlJsoOI0AuimMyGNEch8ByIS
	8lzOnkz53Fp0inmWAlAZTlLhFq9HQaNIAQKzx4Q9PV5si7Q1r90O68FulQJcNmB2T1WgAg
	UBhh2RTho8/XptFv5BAf+enFsbeeFTI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-8nemKXQ3NMa1J8FoALv62w-1; Tue, 02 Jul 2024 02:59:16 -0400
X-MC-Unique: 8nemKXQ3NMa1J8FoALv62w-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e845856a7so435442e87.3
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2024 23:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903555; x=1720508355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rd/RzdxgFoao+tjvS20h2iENS+qz6H0tKNh29qnyTTQ=;
        b=NKMUaShFnydlwNGyh45u/4BqxE56g817g1w/YvfzNjS9XqEOZDidOgUwbYSlrFFO5b
         Uc03tQjMng/WITCR4mLHveDoygFcuo36ksJHU/WacWzqO7XRpTzRXxlk4vE7feVspt3I
         npBeKxedvwGvo4uBNjKF1av8eLED2N3ci3cqrGJsqxlyPRdVfbOP6VBSR21SI5n0KmiV
         Kt1uN2VrXv5XqIoudlyyhAGnue2gnTbRFl44l8nVQ1B6BHWr7MQh0U9vr+vDs/SYxHJm
         wEV8lFj/ObeVu0lMjuy17fFtPyJ6Sjh2e8K9Qpfz0u2EKx2R5RWPpjGiE/J59lK+e8ML
         iHFA==
X-Forwarded-Encrypted: i=1; AJvYcCVDwqYZONr5AkTdyNxTKMFa0kRZs1nxrGhch4P9dSwNW3bChm+4a9n9YbfpTjAMiWtpZuS4l19OErYTk6XVsQpAiNA7lZu4/YhDig==
X-Gm-Message-State: AOJu0YzeRsXkjGIh5/OHmIbo8M/iuH926X/Jm1zGBIFcl7Hfa3B+gD9q
	Rfa18BOC7IfPF3Imi0mLq0ocBlA5Uzu1oQdNIxvEoSpsKOFr0PB2TrEGkOdDtl3eh8Az/3hj6Wg
	0bVfc+U/z4FhY9bK5fB1qnlKN9aytGmDKwYYLQUAuiWs5mLEYaZiYzyVox5M=
X-Received: by 2002:a05:6512:3b82:b0:52c:d7cc:33da with SMTP id 2adb3069b0e04-52e82781728mr4311175e87.5.1719903555007;
        Mon, 01 Jul 2024 23:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhDdqPcifqRCMpdR3/pZrpWaJ0ehef+3kASf9fmzugXWnbXQzPcb1hFh97Iab2IrnSolSs+A==
X-Received: by 2002:a05:6512:3b82:b0:52c:d7cc:33da with SMTP id 2adb3069b0e04-52e82781728mr4311164e87.5.1719903554605;
        Mon, 01 Jul 2024 23:59:14 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42573c55ff4sm160862905e9.46.2024.07.01.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:59:14 -0700 (PDT)
Message-ID: <ed7a3800674cf5bc94f4d8119f6f7c311f9e7eaa.camel@redhat.com>
Subject: Re: linux-next: build warning after merge of the pci tree
From: Philipp Stanner <pstanner@redhat.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
	 <helgaas@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas
 <bhelgaas@google.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Tue, 02 Jul 2024 08:59:13 +0200
In-Reply-To: <20240701201532.GA272504@rocinante>
References: <20240701192453.3e4a0a3e@canb.auug.org.au>
	 <20240701193748.GA13881@bhelgaas> <20240701201532.GA272504@rocinante>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-07-02 at 05:15 +0900, Krzysztof Wilczy=C5=84ski wrote:
> Hello,
>=20
> [...]
> > > After merging the pci tree, today's linux-next build (htmldocs)
> > > produced
> > > this warning:
> > >=20
> > > Documentation/driver-api/pci/pci:10: drivers/pci/devres.c:556:
> > > WARNING: Inline emphasis start-string without end-string.
> > >=20
> > > Introduced by commit
> > >=20
> > > =C2=A0 06fa2e1e9116 ("PCI: Deprecate pcim_iomap_table(),
> > > pcim_iomap_regions_request_all()")
> >=20
> > I fixed by changing * to \* here:
> >=20
> > =C2=A0 * void __iomem \*mappy =3D pcim_iomap(pdev, bar, length);
>=20
> I wonder if the following hack would work too:
>=20
> =C2=A0 void __iomem * mappy =3D pcim_iomap(pdev, bar, length);
>=20
> Separate the asterisks from the name, so that the parser will no
> longer try
> to make "mappy" bold.
>=20
> Also, "mappy"... Philipp, this is so amazingly cringe. :)

The kernel community has a reputation to defend =E2=80=93 that of not being
boring corporate people :]

P.

>=20
> =C2=A0=C2=A0=C2=A0 Krzysztof
>=20


