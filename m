Return-Path: <linux-next+bounces-6040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EAA72B17
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 09:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB37F175065
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 08:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392003A1BA;
	Thu, 27 Mar 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CLcB4QIE"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25C1C760A
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062890; cv=none; b=UPYzn7cyurDENKB0qxP5+15sjCn9tSSXaHbLpfhqGYoX77GpFLMbTzlhUdKk/hsFMINeyHuZMNOAU82l/ci/hZRUlL9LsSyOIY6vN6BpfWvRQVWl6XL12SvAvvlROX6r5PPuCcwL83N6A3pj15tTSp7BdUPiZGHVGyhmupJohzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062890; c=relaxed/simple;
	bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnTf3tYxEnQpD2bY0Xbm+Yr6B5ML4B1Q8eeRe0GoO6CHDwj3J2xmdBRbZvK9qZnBEWUc4oO0Ikke9P7auIxDn1GBTWXfXa95TDNNNlsW15BomA2i3IM1JaNTML8WqD8+sJNtMAXeAUiv/+DGQaHRi42df9Yy68Dv0XWC6B6VA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CLcB4QIE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743062887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
	b=CLcB4QIE2FC3jO05eTxxBA/9zCMEtcFJk9fwiH4PA2yWv5wfDxdCP+sFRuGPyWSgHVltjw
	noAPEY9lgGyOybvG1sZMz0Oon9VXye9u2cTBGMzaL9UWWIn/nvftPmhufDavYK0E1jDDs8
	Y6LejZyCsWKf+jsC1/fpyEi1isMiG60=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-uZ9iroBgM5WdEuQjPJ6UvA-1; Thu, 27 Mar 2025 04:07:35 -0400
X-MC-Unique: uZ9iroBgM5WdEuQjPJ6UvA-1
X-Mimecast-MFC-AGG-ID: uZ9iroBgM5WdEuQjPJ6UvA_1743062854
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39130f02631so200183f8f.2
        for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062854; x=1743667654;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
        b=FGYHyTwM1d60eHR5DJWb8A3p3s+msEb0dCRvBzHNUSaOrd37vrnyfM15t7NpES/VsQ
         cPM6U3ZZ1Z4X+DjFkBq6+1Wu+PdLhRKvuRZ1Vi7Lpay8i8EoQmuuZC9q4MCyTuJ8xynF
         ClG6+mna261XSm1ajAK0gQjYH4GZ+hCUjK3woBJP6Bso4ILqOmT0/eYccX7VKahlCRas
         5Af+lLIPsbyfA8X5NjReQI8q6xKCIdTQeU4/O/o1CNoJZLS4KlNc6fo/i7BxAG0+o3p7
         oWsRvbRvWjis+Z51gmW0SwYQkdAaexUjUMDVHSL3QgyqfCTI5uViQRd6PV1pJiv+BU9x
         T/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTonUZ6EM6OjbZqqCLMArIo1lyRSZAXDCMfOoyZcL29nzBdz7Sr4ZhLKR+/7yI7q9Asm6eyVPjm8ht@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YiIxNNUF5K1p8mfFA8K22dIHXkG0DpFNJuON/fF+pkfk/kQG
	5hTG9hKMOgtH06oinMX8q0AW+velBHIi5P+ZU2FirGdOGucBNTYwWIep9WAHRWe4mCF1jOkP7Aw
	qlhglZB2Y81SAA7JST1nZ5pNERd+mwvC9JSAkB0LtJxlfcvV9VZWgy0w+bLk=
X-Gm-Gg: ASbGnctKr0LVI01r9IAG7JCQTE9ZUcz43QznL8LbxsE+Hazr+JTFg7EWs1r4zQbxoll
	pNm0Tl26iBy/uenXpUECmzmUW3HCSQVRgsqMEw6ruEtR4MXpM3TE0bUPMNdmTdi9+UggRvInqg9
	G0oVytPYhJiZH9YSQnfyP1HCfbiaf4tYmWkcPLKSD8E1z3tKRzSyWTgZt4oP0z0WBfmwwqAqqp8
	Lavgw/5LBki45dHrynySuLd6hmYlDEYH2z0VQnJvBClXcWH8ByMxx5Jcfyo8VVF6FUrWojYLsQ1
	Q80R4MkJXINEjgcb6umztx5/dvjUQIYWO/5qO4/V1g==
X-Received: by 2002:a05:6000:1842:b0:391:4231:40a with SMTP id ffacd0b85a97d-39ad17544c0mr1979106f8f.33.1743062854311;
        Thu, 27 Mar 2025 01:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf9uN/JgNXtFj9T7MptoPFKJeJA6rQyEYSZhVSVIbyMTAAE7/6rGO9+dey28XZtQL+Otguag==
X-Received: by 2002:a05:6000:1842:b0:391:4231:40a with SMTP id ffacd0b85a97d-39ad17544c0mr1979086f8f.33.1743062853916;
        Thu, 27 Mar 2025 01:07:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedeaesm31226775e9.4.2025.03.27.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:07:33 -0700 (PDT)
Message-ID: <eebfe0d0dc31ab33fcdd190eb4a35c6f8b68ac35.camel@redhat.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
From: Gabriele Monaco <gmonaco@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt
	 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Thu, 27 Mar 2025 09:07:30 +0100
In-Reply-To: <20250327180152.260be33b@canb.auug.org.au>
References: <20250327180152.260be33b@canb.auug.org.au>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 18:01 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/tools/rv/rv-mon-sched.rst: WARNING: document isn't
> included in any toctree
> Documentation/trace/rv/monitor_sched.rst: WARNING: document isn't
> included in any toctree
>=20
> Introduced by commit
>=20
> =C2=A0 03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")
>=20

Thanks for reporting this! I forgot adding the pages to the indices..
Preparing and sending the fix.

Cheers,
Gabriele


