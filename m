Return-Path: <linux-next+bounces-1031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D084BE9A
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 21:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50CC8B25783
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 20:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856441B94D;
	Tue,  6 Feb 2024 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJHldAVL"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07471B947
	for <linux-next@vger.kernel.org>; Tue,  6 Feb 2024 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707250914; cv=none; b=jVpEE2RKeDA/Bpsd6bGVD/WltKUq+4V2OlxIQyV5yWRI757H63tUXoQS940YjJjelANNPieDxu6KtNMt0IBl3VKIK/yo7w8EGB8kyOoq+mPjrwhZVylrKjLuovTn1zrvy9PGisbfIlEKiLNe0IfUqlTROWWZXdAHLT+pbH2dGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707250914; c=relaxed/simple;
	bh=XBWmAmkri8oGzz9joCMe1mu+RV9zbBFo6r7zAXZX7DA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sfvdr0A3knVoPo7p0RUMFzeQs732JkLR/aAu2phveo/KHruJGDrCqsYeiyMhIa/t30tC4+vcCsJ7pjK2nQRIV5petbfwcjTO1Z5gcALYK5FJyV6sgg3CwQcd3gQlPaK52v9HY6XSVPq0XCTmE5+KwXWnm6DCRQCq8AYj8NC/h1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJHldAVL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707250911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBWmAmkri8oGzz9joCMe1mu+RV9zbBFo6r7zAXZX7DA=;
	b=TJHldAVLYE+AZmnEB3TJmRJ2wk9M+D5l5nIsUHRCqVBf4SU+uj/jD2QoSUk0uSaOXsi8oV
	G44znxurO5Apwts+KArOOy8+lv+dxliibQ9sm20zxAolaS7vXQe6QNYxXFErQMRTgdul/v
	WJpcUFeIhZlnQLl24Xd8N/UORVgJiZY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-o_ch11fRPMSjyvWH1UofVw-1; Tue, 06 Feb 2024 15:21:49 -0500
X-MC-Unique: o_ch11fRPMSjyvWH1UofVw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-55ee1723ff6so452351a12.0
        for <linux-next@vger.kernel.org>; Tue, 06 Feb 2024 12:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707250908; x=1707855708;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBWmAmkri8oGzz9joCMe1mu+RV9zbBFo6r7zAXZX7DA=;
        b=X6mJFVvuI3SgihVc63tmAyFlcf9Rp5XGsMWCqdtrtzRKsCvdOFcMoitz6yGP25yxzA
         SA9lfxJI2rRysXH5+BhpGD7Iu1a52Z4IkXQHGD8dQvKIA2Bg+SFHPIr9bMTXi7+xmIDM
         M6CY7PAp/eoTD1RT5ocESJamzmzxXx9IybRCbJlCf9+NuLgCcp1iSvYPC2lWIOyCk3JT
         TnsCxwVeFHV4TwSmQYnvrVfP4mYoKA+LreCGk1Mna13pzQiGOaPU8a29rtle3cDgyy5x
         4IkAM7zIEPUFiHaL433+FP0mGC3RSeWt8uSMn6EITP4gRmeFNQ2C18dgD5TK7BCyYGgR
         zjRw==
X-Forwarded-Encrypted: i=1; AJvYcCU1uuZ2jAzMxjbUkxPNH+OCsf4mNTKEH+2yUjERPSKqldIgR3ki2uq+GjbwSXJFi3HDw/zDwWhFBHet8WwxY04ihMRQnh85BBjHIg==
X-Gm-Message-State: AOJu0Yxc6HelabwNIkn52/xYyRT1rx23mz1P6knwDT/xaR9qi/zGeAys
	Ul+zVsZLbK065YshZkUpfETu1oA+6QJ6/rzNRUksIYJGnukHkOdY6+sQCI6dJbr8ng+GNNO310s
	CtDfGSlAc/fHFG1fFCZ3J1JY/qNihI9w7k4RT6uq7wMk5UmclSrtL7yKA80l2xZLtpE8=
X-Received: by 2002:a17:906:2b19:b0:a38:5b7f:b673 with SMTP id a25-20020a1709062b1900b00a385b7fb673mr348021ejg.7.1707250908464;
        Tue, 06 Feb 2024 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgH1bFgAtBqJlRy3+oSc4XtCzivAFTBXnopeTApaCZxTD1IEmbH4z95JawoIidreeGHLD73Q==
X-Received: by 2002:a17:906:2b19:b0:a38:5b7f:b673 with SMTP id a25-20020a1709062b1900b00a385b7fb673mr348015ejg.7.1707250908129;
        Tue, 06 Feb 2024 12:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVouwe8cl9sV3zX4so5DXsOAo+saYq6Gxv2n4iq4W0nk34RQ66TplBrUxdo03z36kuLX4pKZ03pJeUwQsLV7kA3gRQd+lypGSO/JROj6aVAzOTGC0dpWMLCNYM0eOU7yUiSTlwjaUBvMtnHHeAFbOAVnIebslSJsmP8AeD3RDB/WZTibVI=
Received: from pstanner-thinkpadt14sgen1.remote.csb ([2001:9e8:32d4:ad00:a792:8bcc:713c:8e46])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906381a00b00a37116e2885sm1528388ejc.84.2024.02.06.12.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:21:47 -0800 (PST)
Message-ID: <1aab79c05e0192e5e2299586591517e134c37575.camel@redhat.com>
Subject: Re: linux-next: build warnings after merge of the pci tree
From: Philipp Stanner <pstanner@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas
 <bhelgaas@google.com>,  Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
	Mailing List <linux-next@vger.kernel.org>
Date: Tue, 06 Feb 2024 21:21:46 +0100
In-Reply-To: <20240205160908.6df5e790@canb.auug.org.au>
References: <20240205160908.6df5e790@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2024-02-05 at 16:09 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the pci tree, today's linux-next build (htmldocs)
> produced
> these warnings:
>=20
> Documentation/driver-api/pci/pci.rst:27: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:27.
> Declaration is '.. c:function:: void __iomem *pci_iomap_range(struct
> pci_dev *dev, int bar, unsigned long offset, unsigned long maxlen)'.
> Documentation/driver-api/pci/pci.rst:27: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:27.
> Declaration is '.. c:None:: struct pci_dev *dev'.
> Documentation/driver-api/pci/pci.rst:27: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:27.
> Declaration is '.. c:None:: int bar'.
> Documentation/driver-api/pci/pci.rst:27: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:27.
> Declaration is '.. c:None:: unsigned long offset'.
> Documentation/driver-api/pci/pci.rst:27: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:27.
> Declaration is '.. c:None:: unsigned long maxlen'.
> Documentation/driver-api/pci/pci.rst:67: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:67.
> Declaration is '.. c:function:: void __iomem
> *pci_iomap_wc_range(struct pci_dev *dev, int bar, unsigned long
> offset, unsigned long maxlen)'.
> Documentation/driver-api/pci/pci.rst:67: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:67.
> Declaration is '.. c:None:: struct pci_dev *dev'.
> Documentation/driver-api/pci/pci.rst:67: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:67.
> Declaration is '.. c:None:: int bar'.
> Documentation/driver-api/pci/pci.rst:67: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:67.
> Declaration is '.. c:None:: unsigned long offset'.
> Documentation/driver-api/pci/pci.rst:67: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:67.
> Declaration is '.. c:None:: unsigned long maxlen'.
> Documentation/driver-api/pci/pci.rst:110: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:110.
> Declaration is '.. c:function:: void __iomem *pci_iomap(struct
> pci_dev *dev, int bar, unsigned long maxlen)'.
> Documentation/driver-api/pci/pci.rst:110: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:110.
> Declaration is '.. c:None:: struct pci_dev *dev'.
> Documentation/driver-api/pci/pci.rst:110: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:110.
> Declaration is '.. c:None:: int bar'.
> Documentation/driver-api/pci/pci.rst:110: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:110.
> Declaration is '.. c:None:: unsigned long maxlen'.
> Documentation/driver-api/pci/pci.rst:131: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:131.
> Declaration is '.. c:function:: void __iomem *pci_iomap_wc(struct
> pci_dev *dev, int bar, unsigned long maxlen)'.
> Documentation/driver-api/pci/pci.rst:131: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:131.
> Declaration is '.. c:None:: struct pci_dev *dev'.
> Documentation/driver-api/pci/pci.rst:131: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:131.
> Declaration is '.. c:None:: int bar'.
> Documentation/driver-api/pci/pci.rst:131: WARNING: Duplicate C
> declaration, also defined at driver-api/device-io:131.
> Declaration is '.. c:None:: unsigned long maxlen'.
>=20
> Introduced by commit
>=20
> =C2=A0 fbcc7d7f7948 ("PCI: Move pci_iomap.c to drivers/pci/")

Oh oh =E2=80=93 Mea culpa. Will fix this.

I'd just ask for some direction how to fix it. My instinct would be to
just remove it from device-io.rst, since it's very PCI-specific; What
do you think?


P.

>=20


