Return-Path: <linux-next+bounces-8494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04627BA0670
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 17:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F79F3A997C
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 15:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8F72EBDD3;
	Thu, 25 Sep 2025 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myXWvPby"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE22EC0A1
	for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814686; cv=none; b=kjwd583giEpy4anysGUV1S9lUh7sRSc8HmgsAqsCSyeKZgsv3q7Ax/rMPMZRgisAXj1lTLuDYDXr+YKG8PeDZv9cYhka7mzqFlw25Cm37SfmcUYIlacWaIjQ7v7nkKfsDcdUq5WFkMWkRxIhcD4i4wktvQhaASJ69sNJD5AXynI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814686; c=relaxed/simple;
	bh=ZWKVJQhQO85PFVLst/dJeOTjr8/6ZNeNAjSmlGSuq6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVfz/43l9OstObTIFnMzjqa/vseVFs/jJiaTJgADF9MTEu9c9S7n9jwenxZTH3qp+jsKy3lkxTG3ZcJ0XMh9vFptxSE55mj9OVTbmbzwpGlNYJxphumFkSHR6+LklpvUfHiFpfHMrBT3f4yBMO/G1sozHRofyxz0xlFlsRkJvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myXWvPby; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-795773ac2a2so8662386d6.1
        for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814684; x=1759419484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8i0IjZD3Pct6jS0K9QzdWLgF5ClOIU5SO5hpVGPEko=;
        b=myXWvPbyPVjpZDv76uP6DojN5y0CIitAIxcfDZQ/zSxsVfzb0jxK+TjRAvPr4kPoT4
         TnFEZXc0lu7m/+so65XXeWJ5xGuIbQMAPDBApeWM1Qvt8lljvz8H4FbRMfF+j5SFj5UM
         KXRk76KN1MfRrPe3TSmixWplfKRFxDu6qDAbNP+se9MqGoin6ljB4cDsQgJRBsiyvQjf
         LXvKtj4zmRBDzySKl/bTndk++IuZC9auijOjWkobUEdATO5ik52SlF5o5BWShjPKm6GP
         mYRp8PJphFbcdVs0shJ20h+fI9l7vM1OmBUTE9FOB2j+0wMDA7DaKGuy6LL9ECWr9vH1
         REEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814684; x=1759419484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8i0IjZD3Pct6jS0K9QzdWLgF5ClOIU5SO5hpVGPEko=;
        b=wH0sByX0gMAdRuiapBDogBuHRBIUUT8ALZwAqIGedetpPKSLRiaCMwnw8jZloyQ75q
         fssExZKpSuLTzq//ky6MVsQuvzQhpL6j8gm+YveOy32e5NGbtp/jvElH1VbH8kFkqEw4
         +0LJdn+QMj8eDKU6gG3lZuTQX84IoLRjdk6qnYNsD0hDYgwprEkK17MbcPnrSg7bcTBg
         OCOXfsr1BKOrOz0kSSLOMkSHCU1yAetB3JbGRx6YOvlF7+OSITFZ8OP+vHZRe5+cNgbH
         vA1JsGh1cBGtVO82MgNbqGESEiZvxXKynOx5L6y0bXkTfppiDG+rvDFO5D1SzrsHHUiw
         xRvA==
X-Gm-Message-State: AOJu0YwMqpGW0J9UxZGZuBLsvSV+VSDqOUWE7JhxTgY6dEZbc/ELql06
	IoYhPe9Sh/X+Y/xqtze9Ugb3qnUxiIGoTiAKAvnCkH9nEKgl/mDy4Rwp1M/k1KlShfLqwE0HOap
	It9oq+rCGSZoz/OhduPYNeuNDBlKsveunpA==
X-Gm-Gg: ASbGncv2dJ92ZqMOlQDgha1cje7TL8ZWjXQcRZn8Ozd7+bPrK8F9SWiEelUp55FkPmE
	itO1Kg0ggkqOdbLk/kj5ZDOyxvaWq5XtiBYpm2J9iW7Q9WJY78Vmoy4mxO9P1/zMaDi63jZ3z4L
	76YO7AL9IhMQCBdLClsXyXu0Zm/inBx8pk5+TQP5si7fPUoNcI8Lyw3ig4DwpsvL6tijbtdbWys
	BqXPqeJdc2MXHKrBIBgq3yJsiPt4IkzoimgHRcsVtzSQc1gvOnxEgGTKBxjnf/A//r3Y/2RGcGv
	7uLTKoA19KiXTMdTwDg2M9DqPWTfQTvN8UWguf6jc5pr2cU7juZLuALXyCFQRL8zoCxq/5kHBbm
	3BfQDOgYYKIO+W5OnQ/fegA==
X-Google-Smtp-Source: AGHT+IGYkjlNqAquvUGYdoars3aCxUqWAyfn769FJVVQKoSImqe9jR4JyUdk8MOEby7NGucpyFW/cShWe7F8c02WdP0=
X-Received: by 2002:a05:6214:769:b0:720:8825:f1b7 with SMTP id
 6a1803df08f44-7fc2874431emr49445596d6.9.1758814683507; Thu, 25 Sep 2025
 08:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <392013e6-3012-46a1-a2b9-4ee932eca80f@sirena.org.uk>
In-Reply-To: <392013e6-3012-46a1-a2b9-4ee932eca80f@sirena.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Thu, 25 Sep 2025 10:37:52 -0500
X-Gm-Features: AS18NWDFGBwy8fo1xBeNF2K95krRG1ryr3vbF8PehvHoSMfuwAFIeXdhWkMK76o
Message-ID: <CAH2r5mu8zURNZWKYbrUmG+mDXpCBjwGY0x0hOU1MYdjqfXo-=g@mail.gmail.com>
Subject: Re: Missing signoff in the ksmbd tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Stefan (metze) Metzmacher" <metze@samba.org>, Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Metze fixed the missing signoff and I have updated the ksmbd-for-next
branch (also now has fewer patches, and some he has reordered to be
less confusing)

On Thu, Sep 25, 2025 at 5:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Commit
>
>   d76f0acc84fa7 ("smb: server: make use of ib_alloc_cq_any() instead of i=
b_alloc_cq()")
>
> is missing a Signed-off-by from its author.



--=20
Thanks,

Steve

