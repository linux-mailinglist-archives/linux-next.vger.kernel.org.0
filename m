Return-Path: <linux-next+bounces-5502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18923A3BCAC
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 12:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 650453B7101
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 11:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABB71DED57;
	Wed, 19 Feb 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al0yEr1p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1C1BD9DB;
	Wed, 19 Feb 2025 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739964198; cv=none; b=MzdgVHfYgdphw9l40BlsbWkJxN/3UXIwzBowx+vpJlpMRrKUMFxELr4kHV4V7jD4yk7Xbb8AFkRYHDzK6U7glfoSo3eP0jdiu8FhIYG6lyxpy4SzQQDIXxLuzQHAypBavgy+YdgvgBfBQlin32aeX2VKO9zWJS0cEVjQiFi1L+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739964198; c=relaxed/simple;
	bh=c8JwRb94PrL20dwFiOW9ciqzWBm/Y0iIqCKRS5y4A94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la2qlP2N/yIGuTZofgM+DMn4lVpYKXZPpkP5VG/0Cx1FCsWMPJ2i77CZSwoMS6ORmJ+MA/LBkV53tLGeg1u6gm7BnbWNZv+OzD8u85X5poO0SI/ZR/58GS+QDZglDHWSc/46viTkCRkFcJrhyy7V8Mqzv0ssVPNZNHSuhfx0VTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al0yEr1p; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e989edb6so134916205ad.1;
        Wed, 19 Feb 2025 03:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739964195; x=1740568995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpy1K/124+Brov2qirxUIHOxDDVpXvNa1x5dmVic91U=;
        b=Al0yEr1phZnGk93R5AXJDQV7S3U/Lc7WtjH9weDS7nKEsZQEy565AJz5aSfDpnMu40
         WrFF4LLSNCYS9BVnO5YR61Bw02/1V2SoYj9DVUQOPDhbcp8TkPkOeO3xgXNB4vaJ8Cdu
         AndOh7iCLbVx1TgGGiLFfgLCaw3O/+xaXFvGpLy28mAPg6K+4DVaO5wsqgW0SJEZqWWn
         R0oNXAoAetcadBo//I990UOJkUyYOSRYJ+ZtLqCSIX4W6NJmMsxlNFeH7YWvPg8tp5Nz
         ktLHnCq9jSFw83kH3IIFOH8K/DsWAUwmrBDU4chOJ9ft1ljtve7bJ33JTdajJBzuvg5K
         6V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739964195; x=1740568995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpy1K/124+Brov2qirxUIHOxDDVpXvNa1x5dmVic91U=;
        b=Xz50qr4Z5EYT5ySxlUW9CvbbqyTakUyoQR2Td7jqeGldAUGxIv4w+1NYdaWAY3AoeC
         QICCf3y1px6tz7EVyRYya2amke3zQfiaNrXk7TysRGXEk6Xg0L2vU7DAKPOdqhrz+bQ7
         Hd1QudXOs8oqvq4So21ZXavyBWHB3ZyLWwptSkxFuzsFGPGTe7fb9Wye5PKNYOgml2C1
         iq95oJu34rhC30F5zcIY4WCtR0kHzC7AdKPor6uGNrbLRBEX5m76jfVBVgfe4grB0enB
         M/7L8P5MRTV9UiRu54BGipreudXskLRbvL44mZHpGh0XL9VI1y5V3EV5NdNnZ4cvm3WO
         ZrUg==
X-Forwarded-Encrypted: i=1; AJvYcCX/xmAwp2EY4NUP9BkAh0li+UlEAcXbeQWWrIC6MKfwaNN3Z5kcgTzI6hloSGDYatp4gTYMNjV4uYKTxuI=@vger.kernel.org, AJvYcCXXhtfHXxT7P+pne/8BWzRKmSa44I/CI10PVdufWvekhEFqej2zVJvLQcXQAkmhBBCBlt5Hv8ZeTg/vbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+xD0SmhCHJd/14t2Bz2bNvgLnMsKKMMmuZEKgxzbsKy7vdWs
	zmox6greKgh4V53Sb56/5fJF9yUckR1xVGbqeLk3wwKyGaLTP+lv
X-Gm-Gg: ASbGncscD/SBJpmHjwAn3H5+T/sKg9vF70LxZZa7Fjqlaa83Ic/pcu2JK6vfNi8Cel5
	ofL5ZGTRmutW0Ek89P7etnRiltzRsemmqzFTrbLK0YiWQKWM9/3YqUFIn0IQBxFFptewZEPorO0
	MSLVqglnlDS/7Jv0AdqSSLkxRoRIzBezfPhsGozFBDFBHajj7MqmCsGSyOak+Bvz/UfxC/Ivw0W
	DNdRw6ftdqIwTR6PeNqmNLINvGE0RCBLAC55mhBe6fxrHVYej9gPOwe4+VFErAItMuxjkEskEHL
	VH49yKx4TpgcPka7lzhLVpU=
X-Google-Smtp-Source: AGHT+IE4Fntn+4Hj8t0AF1fJ3JU8y1M83gmh2eGfZ9NqaatSCI/ZtVFEAGfEihmnmkj4x4bKw02rbQ==
X-Received: by 2002:a17:902:e801:b0:216:4064:53ad with SMTP id d9443c01a7336-221040bf829mr306826685ad.48.1739964195150;
        Wed, 19 Feb 2025 03:23:15 -0800 (PST)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5364364sm102475125ad.69.2025.02.19.03.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 03:23:14 -0800 (PST)
Message-ID: <4526cb76-db5b-49aa-ae78-39e351e424d0@gmail.com>
Date: Wed, 19 Feb 2025 18:23:09 +0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, NeilBrown <neilb@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250219153444.0046e433@canb.auug.org.au>
 <Z7WaNWHRkqt2rFGA@archie.me>
 <20250219-frappierend-rannten-2ae9c14117ea@brauner>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250219-frappierend-rannten-2ae9c14117ea@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 17:04, Christian Brauner wrote:
> On Wed, Feb 19, 2025 at 03:45:41PM +0700, Bagas Sanjaya wrote:
>> Separating the bullet list should suffice (plus s/recommend/recommended/
>> for consistency with the rest of docs):
>>
>> ---- >8 ----
>> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
>> index 3b6622fbd66be9..cfac50a7258db6 100644
>> --- a/Documentation/filesystems/porting.rst
>> +++ b/Documentation/filesystems/porting.rst
>> @@ -1166,10 +1166,11 @@ kern_path_locked() and user_path_locked() no longer return a negative
>>   dentry so this doesn't need to be checked.  If the name cannot be found,
>>   ERR_PTR(-ENOENT) is returned.
>>   
>> -** recommend**
>> +** recommended**
>>   
>>   lookup_one_qstr_excl() is changed to return errors in more cases, so
>> -these conditions don't require explicit checks.
>> +these conditions don't require explicit checks:
>> +
>>    - if LOOKUP_CREATE is NOT given, then the dentry won't be negative,
>>      ERR_PTR(-ENOENT) is returned instead
>>    - if LOOKUP_EXCL IS given, then the dentry won't be positive,
>>
>> Let me know if I should send the formal patch.
> 
> No, I'll fix it in-tree and fold it.
> Thanks.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

