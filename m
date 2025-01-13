Return-Path: <linux-next+bounces-5182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF2A0B91C
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 15:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 640E97A1EE8
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 14:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD3423ED60;
	Mon, 13 Jan 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="U4bJqmc6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DE923ED58
	for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777512; cv=none; b=U0ws+eLWBJnOJvT46mYOHNI//7R72qXuKir5krQh4h68XE/amF0kT48RSm1R6lZqC62ovddOVCKJZZokfFHtIgXd5aUmk863U9IcEuxBXZtESc5+lQeGpR12XfQDIu2xrsjDSxkQ6W+GJbLKPVjj1NP5fQJsS3UZcv0FE5/pTe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777512; c=relaxed/simple;
	bh=CITCKbSohSrjpd1dhmKYEIAmwjOlz4Bl3bKE74x9T94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvQ0tW0+HQfXo/gihFvssEdUehcQwLgwQ64lBqiJ4B/HqgEM5TYf2uR1wyxDMx7JIMKkKs5wmmYT4F6y+uSi6HwOAyYYW0PKN/bbI3E7/TV0fmKh/a+FtWwjUoP7W6kDQmIHaJKv2qWYZu2I/TkC1T/zh4ggIKYtJQSDLAXMeaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=U4bJqmc6; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ce7935d38cso433575ab.3
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736777510; x=1737382310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkF+tx3Zdf7fEQjB7x96B19ZdO0tM0QqjoFam5UqG08=;
        b=U4bJqmc6t5UHP250xrrQU8OpBtpI6yLcXRXLFlcUvJMryamkJLaejCYltxC7QwNAGm
         EmB9R0sw6V6ka58KIpOROsMmuECc8S72c3PSua1eEDuH5tFH9DiMFD6rjebSpxNc6iIX
         POmqrXgqIa+lmejsv7IvUQouqZgrGCAWNMVOufoEkZ9oUOwXScnmeBI1p4eBw0CkUiLG
         Hi/aNcLyaa9DR87V7mm/QJO2CX9mz3mPdnQMBouk4zWPaMrJSQgWMWygA8fyL+27VPTn
         B3CDYYHkt6JQaVGq13gXRs/EMQYisW4q9xTpjn6p+cZm0pzsTsGegxeqQHvXCTvnhnj8
         E8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777510; x=1737382310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkF+tx3Zdf7fEQjB7x96B19ZdO0tM0QqjoFam5UqG08=;
        b=H55FPh5CygPJuQuP9yfkYkdB9k/U5tkx09xzHmMprn1Ing30TfEXLrFhBHOhueQp/8
         8sebTbYNwIGhfXhbx8+/IBt+HmIpnY7uJgXpO+4S3Hq/R7PAg3ZbAXWHlB7U6/GaNYZM
         p7KGcKA5GERzjIX2KEN/wPKJ2TbR7Bz+2aDmQ71vBHRF0yt8ny5jmtwLwPj2UnGg/axq
         DWYDcjeWcoQPgmFaIQAWIwCkQHTQy5AYD3VhEjbVqprZUDsUbasTc1bAC//6kE7wJLL0
         x7dKiDvN2MlZR/jNNL+zL8G9Nmq5QeLQHrK0tqY32HjbBPzWnKhI6/CMP4/S/clXYtEM
         Hl0A==
X-Gm-Message-State: AOJu0Yzq1u54yFazYhF/lM5DIxw1sGpGub14c/24rTrblrunHFCCv8fY
	nEqIpcuWDJ5Oi2lRQfYjEOaLbrkrUf6RXt5pOuCEbMAFJtfLouGJF7waz1ilei4=
X-Gm-Gg: ASbGncu8l8+6wMTGzbxc/+FDbFYJrjUV09MjtzToPW/WZ2cj7WWCPMbvlgTBsEpHG2B
	6GW/GuUDQEi/w0g8dToE6G75rCdIEuX237qaHpQa5WF4SEYuQQHSvdXVN9aATFUyLR8b+bKpmS1
	QHRo4ioAIJBW18Crui1WQ+tY9afE2rzWGDUcT6SakM0lPCgzmxtOA51haMswwEqUy36OC/amOA1
	+/s1cWKBGwnsMIB5m7lZLeiWqltRlylniAzV5aFjwU8J0VokUS2
X-Google-Smtp-Source: AGHT+IErqDdONMGNYb5aIsrvlJ9Mo7LjWyNWe/1sDdXiUkJcdc6j5r60f1YEeV/OOCooDIGRQNFNwg==
X-Received: by 2002:a92:c9c6:0:b0:3ce:64a4:4c44 with SMTP id e9e14a558f8ab-3ce64a44e2cmr43977615ab.1.1736777510602;
        Mon, 13 Jan 2025 06:11:50 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b7459e9sm2749780173.118.2025.01.13.06.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:11:49 -0800 (PST)
Message-ID: <9c81af73-df8f-4735-97af-edb2e3544e48@kernel.dk>
Date: Mon, 13 Jan 2025 07:11:49 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] md: Add missing md-linear.c
To: Song Liu <song@kernel.org>, sfr@canb.auug.org.au,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com
References: <20250113061308.101069-1-song@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250113061308.101069-1-song@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/12/25 11:13 PM, Song Liu wrote:
> md-linear.c was missed during manual fix-up of a git-am conflict.
> Add it back.

Gah, please resend the pull request. This is too broken to live
in my tree, let alone the main tree.

-- 
Jens Axboe


