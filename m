Return-Path: <linux-next+bounces-4113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90AA991068
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 22:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B100E2825AC
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 20:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8ECD231C85;
	Fri,  4 Oct 2024 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoMY3EcO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36295231C86
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 20:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072972; cv=none; b=bp4+xobj77Z36B0PUnMnAyZee2DzEALL50AFH0rA9z17ew6t+7TRXKgxiuCZjAFzX4oMjwYkdBJ2NgnAuo3MydPfC85U2jWnm2dD9UrpaIuqhQylA/pzZbu0n4+b92DD8t0g/JaUyvL3obS8+xoZmjGpTXzZPhgaUSpf5dliriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072972; c=relaxed/simple;
	bh=gDMYe+jKoEJ8fxe/esZs1wlMYuZnoUAi4RnHGk7Ejd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dia7rgb13IISOGmddu52s1GH+0glomaW8u9mGtnvGQ3EXqWVwnrcMYuL8Hg/2PG+t5D/+je+4EDOLw8389lr/xzbW/WS1Z7EGsYXfHkKZWsDoikWYU8xdVI0DIgFjvt+KrNTBdHi+kYAhLb8td5jNk/MsKR9707CHeitgDSAIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoMY3EcO; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so29980031fa.1
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2024 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728072969; x=1728677769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dHYk+MrPm/hZOoQZZWB+4hUtFxfaMo8hTQTVzlSLR4=;
        b=YoMY3EcOkGbeBtADMf/J1JV7pzRqvltwzoQwPfnfJW+xtppI5GrVMLR2c66FN/MUIP
         91ga0PcXpxsZcexxMu9MCuoavqgtr2QTsNTDZu3N0J8hZAsWbm1/GavmQO2WJFEtsEdJ
         DacNGIoDU8/gCqbiKIuXvSHAnXU1GpRhv2UgKVvtadoX4/FMNC0lnlcxMAX/nQH4kxTU
         R2BH4CwZXAS+KwgPI7fjFOASc1vl2VM8RjjqWNeYVwbDsS4Cbip9cUq0nJ2bI5B0xJ97
         h1b6ACH07MFIozkdjhVtb9Z7D2Sn1U+IDb62ULcHFDxyjNqqIwihU0gQLvkIcgv+KtvU
         q6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728072969; x=1728677769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dHYk+MrPm/hZOoQZZWB+4hUtFxfaMo8hTQTVzlSLR4=;
        b=ZDGFujWRt7XJ/JZ/KNP+ACSAnyxuudJNWT+YjjXLgYny21G1XMEJjH7C++94sdl3E4
         Rr7ETd+IglK9oG/H60fY9Evr+uvUG2nn1Y+vVuDBHHGTgZF9HW6U1AjLsIeGGLnS7/G2
         p1ZPccMPdj4p5TBpf6zP7ql1I0zwtHr1OZ8KmcbA4zIyhrYegusUCycMNISuRFg5Ynz2
         qXTSaJy0Ul5MER7luOfyoQlQ89DB3w/dNp+vzZmuK3AwtTZNbJZx+9XPv2t8udnZbMxU
         7J9SgAFrPajLpAmVsx7iZWiOJol7xKLx6dQ8zIt4CrM8GgW8TnBXA+RI2FA3V6qroXo6
         lnHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6RFhT02eUGZMoFSw5SW1Suu+ClpjAgadzWvNsc9LD9tScRT2pa02J12+SiAO/I7ehxO8YlmLFP8WG@vger.kernel.org
X-Gm-Message-State: AOJu0YziIAKban6emPVYXfj2Cuq0XVOVJgs4WAYrpGegHQ3wQ6CwlleE
	KfleyrSr60RIDKTBcaaUFdvqBCzTcVxu0rduIr3tzQY1tl9Fw4+D
X-Google-Smtp-Source: AGHT+IEX02PztMvMHQ7imjsXSnRuts71nOzFgAkuPcHo5NOvXPNxlIchktfzK7y56vrCOXn1neafmQ==
X-Received: by 2002:a05:6512:108b:b0:539:905c:15ab with SMTP id 2adb3069b0e04-539ab88d66emr2309590e87.32.1728072968969;
        Fri, 04 Oct 2024 13:16:08 -0700 (PDT)
Received: from gmail.com ([45.250.247.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e663f4fsm36857966b.92.2024.10.04.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:16:08 -0700 (PDT)
Date: Sat, 5 Oct 2024 01:46:02 +0530
From: Brahmajit <brahmajit.xyz@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-ID: <znb3jrzhanlnroetszq7uihcxrxuvw5woue63aengsttabfox7@sndkzayruem4>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
 <20241002080914.841071-1-brahmajit.xyz@gmail.com>
 <20241002144806.255d62115286e173bbf42655@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002144806.255d62115286e173bbf42655@linux-foundation.org>

On 02.10.2024 14:48, Andrew Morton wrote:
> "array".  But really, just using "mnemonics[]" conveys all we need.

Noted :)

> If we want to preserve the party trick then perhaps we can use
> 
> -                [0 ... (BITS_PER_LONG-1)] = { "??" },
> +                [0 ... (BITS_PER_LONG-1)] = { '?', '?' },
> 
> and this will shut gcc up?

Wouldn't that mean we would have to split every element of mnemonics[]
For example, [ilog2(VM_READ)] = "rd" to [ilog2(VM_READ)] = {'r', 'd'}
and so on.

> If we do remove the party trick (as you have done) then this:
> 
> 		if (vma->vm_flags & (1UL << i)) {
> 			seq_putc(m, mnemonics[i][0]);
> 			seq_putc(m, mnemonics[i][1]);
> 			seq_putc(m, ' ');
> 		}
> 
> can be simplified (and probably sped up) with
> 
> 		
> 		if (vma->vm_flags & (1UL << i))
> 			seq_printf(m, "%s ", mnemonics[i]);
> 
> yes?
> 
That does seems correct.

P.S. Sorry for the late reply.
-- 
Regards,
listout

