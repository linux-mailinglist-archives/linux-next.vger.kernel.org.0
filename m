Return-Path: <linux-next+bounces-4237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A0999D18
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B088281B0E
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8914B209F52;
	Fri, 11 Oct 2024 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+Kh1/Rs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048811F4FC2;
	Fri, 11 Oct 2024 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629469; cv=none; b=hTxo402v+rhpE16gFktb7H3aVuFSRvle1nmknEMwAm/uxuOhna4a/9epyzNfDdxULXzyQx7kDCrepBaS0OHGDS/xzMpduFDEPKluL3oMCj2PyW8eCNzU5jrG8+2liD5ASslkxu+d4E/ehie009fA1hKEO4AuEIfdQ93t9IbYieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629469; c=relaxed/simple;
	bh=8upQEaFMUGPR4asJZ4uMH4mliRD2mg3nCcWceaOMyvg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=sAm8EzZpb2qFk0Z3MR20STv0RND4ujI6ZbmihG/ZhVs4l06d04N8O+zEN2ph154wS5DqwlOyUOlWGJhoFL8SX7pEzg3n3ZZEiAmmTBEdig5ihzCO21peeOVQSAC/AFCYPTPeumw5YWkW6cfmUhnhMXi5S+qWgqqI7Z7ALiARvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+Kh1/Rs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e050190ddso1233266b3a.0;
        Thu, 10 Oct 2024 23:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728629467; x=1729234267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/+tjJ7E9JhBsWRHBUSwfhW8GN/uEwBPBEcRmhfyDPM=;
        b=d+Kh1/Rs+jEQgnaYcI9kwgRYgVcJzKOgUpZs+9+J0BhbN8KteKq264Q4QLvnlrASC8
         UXI0brGcqLGthVro/+B4Oa0mz9vtwz+e6syFXAZtxNlcgvbyj/LXtj/PFn3eXd4gYQ2Z
         bYZlsmHUrwxXAmMul/akJNg7T01dkP1sdeYldoqU9nSR5s0uRilMoug+6fB0geuZ7Vz2
         xbFLRDmIw+hFvX2/04bwlerG50qZpCapSyXM7VUh1GObtNUKCL2kOzCQ5Vuz6A7rdQU4
         w4rFRge/kD6phn2NSv+pdYMDMdd2wBp08NLKa0OHRyYJ+lKAX1cBw1Nb19zzF1/IFgap
         PU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728629467; x=1729234267;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/+tjJ7E9JhBsWRHBUSwfhW8GN/uEwBPBEcRmhfyDPM=;
        b=vNdM5zW7wX9q2AKJhlawKcRLJCRF5fX4emiau2JeMBc6TmCBQeCm+CuKwFFLHssSy+
         mFes/4U2Nf2pf41oOS1WQaptfaOguhnXP0pXDjXaYii7PydsesxoiNdmNjPQuz/LsJMi
         275DqlzjFANiTaXgQPPYlu3xstD8D4rIUvbCYbXM3iE5eb8zbyi2AY7uBswHfn3UXebx
         J4AtTb4WTcxVmtaLsboI97nsJieHufvcLsk3P7JLXcgStle0uO0CcKvYORGnNvsppgOw
         fR1uhlfjJ1XNLcPvwMUzwhbPp/07lJdENhFjfdTyzsiP7JhHll2MB/7uq9i0QObe7kz8
         OV8g==
X-Forwarded-Encrypted: i=1; AJvYcCVMk9Xzijx4cENWoeZsf47jeSvR5peM6DiN5FRnqS954QMmssIr69r8Di/bZyHsfj8qCxZgpHBc6ikU5A==@vger.kernel.org, AJvYcCXEaASbaKR8YoZYNLGHpcROCUmJE6XJKgnY1VVeOHa0H14PqmIBZVKw5IhETMhs1wmoYwmpZGzg0lSs9DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiq3j/0U/AjAwVixs+wpYIg4Mp2tfM9o2ekahDeIEsSP+/E8j
	++7+XEam8X7QDMkYPtxNEXQZUivZpCySYjyADwTac3+6nFI8blN9
X-Google-Smtp-Source: AGHT+IGQoHcWQzUGO54cL5ac8Qnj93I5DOK+gnJbwMrgUZtK8PnoPRsYgsD+DxUgF1ccmFnwFivAoA==
X-Received: by 2002:a05:6a00:1894:b0:71d:fbf3:f769 with SMTP id d2e1a72fcca58-71e380c113dmr2773131b3a.28.1728629466939;
        Thu, 10 Oct 2024 23:51:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa93918sm2035692b3a.135.2024.10.10.23.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 23:51:06 -0700 (PDT)
Message-ID: <b58f2c3b-382f-46ce-b2b8-fb39a5c3b356@gmail.com>
Date: Fri, 11 Oct 2024 15:51:05 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greg@kroah.com, sfr@canb.auug.org.au
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <2024101127-scrubbed-unfilled-8b47@gregkh>
Subject: Re: linux-next: build warning for a long time
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2024101127-scrubbed-unfilled-8b47@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sorry for the premature reply I just sent...

On Fri, 11 Oct 2024 08:31:47 +0200, Greg KH wrote:
> On Fri, Oct 11, 2024 at 05:24:42PM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> From before the git era, an htmldocs build (if we had such a thing back
>> then) would complain like this:
>> 
>> Documentation/driver-api/usb/usb:164: drivers/usb/core/message.c:968: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:804.
>> Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
>> 
>> I assume it is confused because we have documented both a function and a
>> data type called "usb_string".  The former in drivers/usb/core/message.c
>> and the latter in include/linux/usb/gadget.h.
>> 
>> There are about 46 references to the function and 105 to the struct.
>> We could rename the function to usb_string_utf8 ...
> 
> But usb strings are not in utf8 format :)
> 
> As C can handle this just fine, odds are sphinx should also be able to
> handle this?
> 
> thanks,

This is a well known issue of Sphinx, which is taking a looong time to be
properly fixed.

For your info, this is a short summary I posted last March:

  https://lore.kernel.org/f735ce0b-db1e-49bc-86ac-b5ab8e4aec31@gmail.com/

I think we need to wait patiently for a fix(es) of Sphinx.

HTH,

Akira


