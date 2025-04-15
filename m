Return-Path: <linux-next+bounces-6249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CECAA8953E
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 09:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0E63A6490
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 07:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A28C27A112;
	Tue, 15 Apr 2025 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ga/oP5aG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE824A043
	for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 07:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702636; cv=none; b=USUdiFAa/RfcRpI2nnXiQh/p49vwFjFRk3KZmWT3YJrpRw6oUDOPy7TsVI6lUw/HOKGFw1IlzZa67HgddT2aAJzFmHDv+5mv8WIhvsSM1IykmeDM1ZHiuGx9gySF85H3PnS+5If2aajUtPW7QbQJyeYJTodG5AxBQOqxv26Vhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702636; c=relaxed/simple;
	bh=thQvJs3pcD52ng14fdk/STuZKvWEv/xKe1W9md5vJCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQR/iIrdMzoOvMPd2kTTvQobIqo92y7BQWZ5QvCaoxa/mDNkdylJLgQtzg/Jtk9WnGi6KcnPbPms5NmQkw3hHykSG6gLs7n3R2pdXW92AWjwGvgIdmjn4QE8jDDQmcTScPYfLSnBhgJzgGTk3t1e8X3Hr9XomSlgxAPJIEg9JEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ga/oP5aG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so24632995e9.1
        for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744702632; x=1745307432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fsVQGeXu3V43MLoNNqO2pG1nVJmJ/d9W3Z9XY8qBjRQ=;
        b=Ga/oP5aGX6iNf2CXDzJEtXBlAbLedTAhrRXuFcIk6O6LFKJ58m2H/O14hX29oDd/5F
         72daGv+QS1mIv/Dwkdu/8Kp9z9HicVG4PUqPRkXuN8AlN/CJuh2aE37fDKfHJX6LKXdm
         aLRvnPe7s3JFMnJNg7bySjyJSK3JRp+kwTgQEx5eaS43xHZAHRvNV4UEMG1mTufB0N92
         r0Gqo+0DAtJtlyA6lTRChjv/XGX8rYXzwmBWu3LC5LmyqjzFwI9cu85gXx+lzkKgiKMs
         vefV9PjIalDdsebtb+6jFwCIeZk7sCxbJ70lkckCmJ0S95FyJGnwXHmyaXTnWtmmV7S2
         1FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702632; x=1745307432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsVQGeXu3V43MLoNNqO2pG1nVJmJ/d9W3Z9XY8qBjRQ=;
        b=asr4YEYlcK09xIeybxYLRBg4jvYC/4bXXmI02FSQDIbwzF7NsSpFyDO8VtKakEDyXE
         y069jKPQavKwp2RHjXD61S8tVKwoKjR/lHS11kg/fca0lL22RQCxVQFPCt1dvAXDjAuW
         GMcjcmmgcQU2yrCWC9RbndMzijLynYOSUan7Jc8ZRX2JihBub+aIIwAUDM5wv8ZRZHBg
         KTNZAwVi+EWTppyhhkp66zdaPsb/wWAirZEPEwB3wJlSJmf3lSR/+6mf9qx8ICMYMMK0
         Uh+Dp8hvkshGMiG9bPAj1MEMv8smbEH0RS7OdIgN/XZiBSoykDrcn9T5R4vqNWQkwJdK
         YIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwIH6Docnvy5AiBFqVhyDFVbb/YNp2IZw36xSxNgJ7EkdVXuKOtn+hqiTFqgSKTeBOsgDAwKbr/p7Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DhfCUU1tWFO7O1gwj5bWdj5PqfX1t4F8lKQL40T8kBnEye0l
	7OlcmX0I/QxImKedh71wI4q8a8vCSeRajVzZgKj8dnjp9UM+bIzjFU1aNtEQt5M=
X-Gm-Gg: ASbGncvF2PRxPJf+4pbIs0EnwFNKjZmZj1KdiwR3shygPWxP8GQ2MsJ2/Pi6z5p1suQ
	gTV9xEQU71atI9NC7htTV9IvZqujLtQlGsvZiy/MKksIhvnp0fs5k6Qp/AGbI/Xo5JGeUAyrqPO
	c2RYLVWt7nD72IpUE1SWJGuRRzAuRma01GorsxVQUDLwftO0fVF83eUTB9Exy6qXOcj26sPq8fw
	yTXAaQLInkeqkXiCRI4wsISMn6p3buJBkV4Oo9VJN8fYSY1pmF0ua74HhutIY5MssoN7O3wf39d
	6fHrT89dSx+bJ/x3hTyuZS2o65b2EYzA38QmlGKLnWpAVpf8sSp7AWvUIDOWesgB4fU3uS/0uS5
	51XAs4tz3jkpA
X-Google-Smtp-Source: AGHT+IEDH5+1Xmf0reupNQ+IQwb15EhzTbOBuUQj6qx77GSEgchr+CYBO3//6JK5BRyM+UOoCkg5lg==
X-Received: by 2002:a05:600c:83c6:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f3a7d6bf7mr153997135e9.0.1744702631853;
        Tue, 15 Apr 2025 00:37:11 -0700 (PDT)
Received: from archlinux (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm13425405f8f.17.2025.04.15.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:37:11 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:35:44 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iio tree
Message-ID: <ghobrewcnnhzq7adqdsdmbvbmwkoyks3jck5hwv7dyir3m2xqs@tqnudkhd5n2b>
References: <20250415162841.5b9ddb79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415162841.5b9ddb79@canb.auug.org.au>

Hi Stephen,

thanks, fixing that.

On 15.04.2025 16:28, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iio tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> /home/sfr/next/next/Documentation/iio/ad3552r.rst:55: ERROR: Malformed table.
> 
> +-----------------------+------------------------------------------------------+
> | Debugfs device files  | Description                                          |
> +-----------------------+------------------------------------------------------+
> | data_source           | The used data source, as                             |
> |                       | ``normal``, ``ramp-16bit``, etc.                        |
> +-----------------------+------------------------------------------------------+
> | data_source_available | The available data sources.                          |
> +-----------------------+------------------------------------------------------+ [docutils]
> 
> Introduced by commit
> 
>   9a259b51e3ea ("docs: iio: add documentation for ad3552r driver")
> 
> -- 
> Cheers,
> Stephen Rothwell


Regards,
angelo

