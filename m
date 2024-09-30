Return-Path: <linux-next+bounces-4009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F8989A5D
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 08:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8095B21B46
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 06:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580A91F5EA;
	Mon, 30 Sep 2024 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC+2E5RF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E197B39FD9;
	Mon, 30 Sep 2024 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727676080; cv=none; b=M5h5zP8wXnrJDltPUnDRFAUrCGZAA4WHHSPiUf+ZgP/hD1eXW86/HKPf8t69qsrBuJgZOqlQPYUSkDpUF0DbRU6rguF7lkUuEg3p/z+qAiCp9YI/+s45IHwowxfMOwU3QBFfRO0ULMhBeBFRTWJA+j/wctdDGzaKlaDvsQnHDaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727676080; c=relaxed/simple;
	bh=7phSm+A7dmEszw+bugB7ketjWPwZ/unfCm4q//6A5HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcW+ZUvATPk4ohol1rZff/3cED9x348miI9RCs/JTrPKmPhhRToiDoqJHfYBKl8PAO0/6X6GGmfe/Gbx8mgh5cMLgDxOq3oEd8uKqOWg4WDdlnyHsjttZNBC5ueN1b4i7740A6L2Vf7FDtp/mIUc9JMbVo+WqYx86YG4ELylY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC+2E5RF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e0b02ed295so503976a91.2;
        Sun, 29 Sep 2024 23:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727676078; x=1728280878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLm8gryLAFA8GeHztz9Dmgkhg87sBBG32XBwB1lTXHw=;
        b=HC+2E5RFBlYnZ7cvilHYlkS8Gz2xCEfmEgRhzCfk4A54CcV2UL1wI5aDXm0AUzSErd
         AvAMND8ogHsGEhtL/nJOpKBTD9+rm2kNxnjjF9h2yV5iS8Tb9wQQWpkblhyXCUR1qk2K
         hYaP3jxhzjMZ7K70bzetfBuPYxsC7lbW+FGvzjkzm3QQdyDHlWDkvDKcVZBSMF3p9ozZ
         4PlXEm/rQDR6qbxNT9aFz0VUGeI4kd5gDKSQUESsY3EdQapiYAuzCNQfVXjVF0yXcvis
         Or+rBM5FTnEPVg1pnCj6p7C24hA01s5Ja+KYoI1iGyx5OL+/FHU7yDfsURgNwbBRDlOH
         Pebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727676078; x=1728280878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLm8gryLAFA8GeHztz9Dmgkhg87sBBG32XBwB1lTXHw=;
        b=tDfbGuOR4igsrKHrCVtiNibUjGykGNRZDWHTZs9XExqYPNTty0QZ4jlhkrwRVQ+Wun
         wDoZouxRUrNMG7thPs8iZC7mEceQcvFlj4Ihwxgu17zWlqnDZ+S96gzHUlORPziID/7Q
         2sG4BLsyUfBl9T340OO+n8QVh8SK/3iSXXyZqTBaWdXLCpMoenzkOCBu1GsLxHB1Ey3C
         OME38+g64l/zDg87aD1NnSa7gawYYzXAkxaKHkqavaF6QZNETN44ab793aIf1ZDhjQvQ
         qrzyHvMxpqEfFtWwBxJlXfBgbEGpEQrr2KEnfJZgMAw8lWh2hq39BPxEuYqXGjzppMDQ
         oQZA==
X-Forwarded-Encrypted: i=1; AJvYcCUaF/WbcCYaFgmnyuyiwVl4n5Q+Yo0W70ldZVr06YQXsKGwi8tBI1L6OB/kunyAoTv0IulKqumPVUik1CY=@vger.kernel.org, AJvYcCVnzuxCln/XlCyIz9LvAUhsEzQ84N4bS2zFsYvP1hLksibUlUIZySP3Z/JQJLMd0R/6LH2yyfzXQHpU5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcD1TfK4yTu/rSGq4+oxvixaKW1lNwA4aAuwcxlyLgH/gqmet
	vUgYB0BLGQBNByVKQz7zSycxUTI1A27tpPbWT/e9521kpxO5VXSQbhExWG4z9fErJAlYI+RD8rq
	JSmhUpOGRLVCWy1UExWE2TtglYIc=
X-Google-Smtp-Source: AGHT+IFlyXF5beFOye+/MuzbHw9lSHXNJOHspFm/e17CqliF4LW1gX3D/IXGhEkxMoOk+Ooy485L0Vd+jRqzBtomSj8=
X-Received: by 2002:a05:6a20:4303:b0:1cf:4edd:e6f7 with SMTP id
 adf61e73a8af0-1d50992b386mr4729796637.0.1727676078069; Sun, 29 Sep 2024
 23:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930095648.40f7cbaf@canb.auug.org.au>
In-Reply-To: <20240930095648.40f7cbaf@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 08:01:05 +0200
Message-ID: <CANiq72kY3q0pNycUctLQGp4BJjumoQmFEibW=GoKPhigH_g8Dw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 1:57=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the mm tree got a conflict in:
>
>   mm/kasan/kasan_test_c.c

Looks good, of course, thanks!

Cheers,
Miguel

