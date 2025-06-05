Return-Path: <linux-next+bounces-7070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D0ACF102
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 15:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17054188D64D
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 13:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B622405ED;
	Thu,  5 Jun 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjjXWxbt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E492E40E;
	Thu,  5 Jun 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130981; cv=none; b=WvMMEtaEVjqZevbzMdcHXT9bHHabEReyGgOpmBDBBDUc7xfUDNyeKOaDqlkgnkN/60OkNO5Ugmsfkxos1KKvmsC9TlXpgTPoVgozUnWBrhutClCYIVs6+BnWuoxqs7FxhjihnRl1KqVvvtQeWEk0RkoC2pd3aUpO11cnamQkTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130981; c=relaxed/simple;
	bh=ZDaTLbspWsJYkFMbFVDMSx2aSEZZOtQzFXBqHuYVc+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNI5e5QQR8Lhol3jcs2+HQVdVNIY7sVPUavY6DYlDTA3cI9ST5V2jYj5kk5eRr1GY1nYB5lKR/JTqz4baDIsf4df2BIX8OZ4oQhD3k1b3VvqE4gGBOAP4Ddy9QQmfR9iZjNWFjGTNaDWUwNMCuSdRr5MSmj45QbrDXes824MNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjjXWxbt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so1322974a12.0;
        Thu, 05 Jun 2025 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749130977; x=1749735777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNYkE3zwLLRZ/mwyxlP9oruoQDkKk7uF9dI/PyYXEU4=;
        b=kjjXWxbtDc8WNOJ70DJAHIaq2nZ9CoUo8dfm+xOigS5QK1lMuTPQFDRc2lk6bdg8Mt
         iJvRpDghDlJ8dWoeXYjNz+9qLRYIGGLsPxgJYsawBQL3Pbcr5l0OBZln9KDGkisjaw6k
         W47ZEqQJH8N2BKBD/xNo6USRjFaRPlINAu7VMiB/JreMrWlZl3EoU4VwSxgZzp051Ece
         vdduecSahLJD3/xILGXD/3HV+ghQPcv7bIe04nCnh2SaEI6zsESOIq+dRmMrGb8uj7OP
         NSoFD6yDRZ1rxluh/sqAHcmmClNjBpTYfi2rvj3P9qa+gj1v4/BFc9vA8I9+bgUo3vrR
         KjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130977; x=1749735777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNYkE3zwLLRZ/mwyxlP9oruoQDkKk7uF9dI/PyYXEU4=;
        b=H6E0RVWfP54aWFvbkM+Qg8NaRtryBHs1K1pnjdi8b4bDHViADUllIzio0GTNhc8DjL
         cUd/IAq7VlM0ord6QxwsbQvWmX+H9s+BL7OkL/ByqxA3Dbl2a0WGMroRHtDKk1OhJc0S
         E9TCHZQ2Orb3NZKE60YyyEu4y+Mr59LZLQMy/BDpryUt6MgDeKSvc2aC5wdSZ8K6tM7Y
         ikOkTpiHN8MLbxb0xdXKfYxy6GWUzT03ZdE54n7C2p8w6jENsPpgLXP6d7C6hGueuhD0
         1VI5lbJHGLPHWgnW2H1/CnZQnoBg8vaOs754/kRHObh7YaLvD8+iIT9DwB/kzLNYdfrd
         44uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL0ix5GcvAv9fwaSnaVK+jCd7LvRxw3ksZGb48L33yHdCBMcdSuULEoifgYntwOyIXWGeBov4nPV0ywg==@vger.kernel.org, AJvYcCWgZ4zl8K0uPCWj72K8+ZwzM9KTuDIf1OstdNsC+8sV70YbgrEzs8KK1D6co69fvwKkWY4fUX9k4cPqROtG@vger.kernel.org, AJvYcCXKpv/hvAI1fGKp5fcrnKFiHv9P6cPxKOVrRcKNNW6bQWUjQpy0Yj/LEEanX4LHTwzFj7iSoFRJqPx6@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0JSkLSVWwAErSXtOADkop2aUVJf39qcNY6MDy+tWsOwGXW/D
	AbXy3N/itcg2coe4bD9GM4GAuQP9oq5C+U+6Q1UMHhaIWSIJMbm33vHhRSlbUl5we8qbIFRHV9T
	0MI+Oh9FYe3gvi6wD0f5sC4yj3ZZBcPg=
X-Gm-Gg: ASbGnct/U0KVDrNDYUcH0BRCfedYAyuUITzDRY5d28a8mTeiOFcg0lPEm9rJx9PLPxq
	NF1iwPn4PxTGdwt8aDcaSpZLgtwO34PVAYWOh88KDoEcuK8/7glI7v2JviXgUL1borzefe2PQOJ
	ldHMkXMIxkFJqsVPFZBJbEkiVo+XrgBbS+L4g7cPjx6+GYT3YNiV705+CttTnZPz4=
X-Google-Smtp-Source: AGHT+IEGRIDZrXauu6JWYOGuZQNfpCjgy9EHpgz/7KTxXLdbQljcB0PFB5wDQdDR+S6eZZxj94P0wdB3S/Cv8wNgC8w=
X-Received: by 2002:a17:907:c15:b0:ad8:9257:5733 with SMTP id
 a640c23a62f3a-addf8ce46c4mr631367266b.20.1749130977178; Thu, 05 Jun 2025
 06:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605160540.76a4c651@canb.auug.org.au>
In-Reply-To: <20250605160540.76a4c651@canb.auug.org.au>
From: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Date: Thu, 5 Jun 2025 19:12:44 +0530
X-Gm-Features: AX0GCFvTtwlzLe3ShBatCkGpgZEQMQYDIp7QZYz6BwjTcXKR31Yiwtz2L-cwk5I
Message-ID: <CAFTVevUGg-HVfd1EBq3BXazLqTbHwALGknFLfyN-rGZv_0UfRQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the cifs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steve French <smfrench@gmail.com>, Meetakshi Setiya <msetiya@microsoft.com>, 
	Steve French <stfrench@microsoft.com>, CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen

Thanks for letting me know. I have sent a patch to fix it.

Best

Meetakshi

On Thu, Jun 5, 2025 at 11:35=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/filesystems/smb/smbdirect.rst: WARNING: document isn't incl=
uded in any toctree
>
> Introduced by commit
>
>   b94d1b9e07ba ("cifs: add documentation for smbdirect setup")
>
> --
> Cheers,
> Stephen Rothwell

