Return-Path: <linux-next+bounces-7083-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB78ACF974
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 00:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36659189C6AB
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 22:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FE827C864;
	Thu,  5 Jun 2025 22:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rkcmRDqR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189EB2798FF
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749161045; cv=none; b=M6lIZKRncRNn2tEBxhe55QhQc/WZPRzPDGD7h4A/G8NioC80xLZHV151UPUczUbC5ktkdisEiGbldlN0XMA/On9G5fYLXJEwpLh6rEDq+XtQ8Ttcrj8CZaFPbB5kmSoQLoTHqajuMTIXIkE9xhSttbWGVdEp+NKvwZVfwaz4pGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749161045; c=relaxed/simple;
	bh=wAoJF+V1ixKUD7xCt1cvsGQns9uQ8DokbH9TB7UIoKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qn955aGU9slFamrebJoNxKvnEPTastrJoVTfV5omLv2OfTJfgNgV+a2QYPcZw7jSlDNKn7ysyVTwDlMMSsF+oPFDeeKRR+YtzSLLARL1jtiQ8WObYCYZZL/wACg/fGv/1SEwcJxRy2vMO1adxtnm6ySJaBtVlxHCSIWxYVBP5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rkcmRDqR; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dd87b83302so6828865ab.0
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749161043; x=1749765843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUXnGKzBcTguV8+MTjnylUmPLATGpHiUDWNltHtDUyI=;
        b=rkcmRDqRXNaaEz7jIyIVXofLti6kl3R0ADBkPl0J2yra5h+nW/gLD8bGtTEW4/rZGU
         8tIKzfrDPxu+/jeC46IThtEPXm+JhNcKRB19n4J95d+UDzOYDDrU6+Y5wa7qYeUKJZ9q
         M0Hq5c6YMVEp02dObEdNyynvTe/gg7Nw6dTLBFB2qH8RInQd6o1GUlQp6rZ+pu0KaSJu
         qpLsriM3pklV3QosSRu4qpbS52r3r7glGUGFhm0+Nwcd7euvvgF5QfeG2hFtlGkPa5gM
         GeP1IisuXXiAQ5zp8wyDCcjXnBPr8weJCOmpss2VQjSO8qZDBwJmCQHWAaMQB81gahUv
         H7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749161043; x=1749765843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUXnGKzBcTguV8+MTjnylUmPLATGpHiUDWNltHtDUyI=;
        b=FHlUnKWsPHyJTXXyOX1pJua9VUsLiR1azauHXTBlsbrw6jP3IavlNT9V59VOpAej2D
         oecSFlAmlQyKIev0JXNyNzfi+bkIN+iXB3PJQ113O1v1+hf7Ret4NWBp00pEQv3skbcX
         mXEpNKJIjm6PLMi3dqH/UV844N3f8TJC/YLJeMYU2dELbwvqx+FxEpRarw8vzpgZ0fKf
         j9LNPT4k5xIBNliCnzEBcxnh2keoWzLDbD5WDHsfZaRXl8qxbqavtFp5G6w90z3z0b4z
         SKxaSSkzKMQce72WZvwIhuo9WdslQLewp9ce21FHHfbC3rWpbSF/64W5Y1/slPnEF54M
         LzHA==
X-Forwarded-Encrypted: i=1; AJvYcCW6kmjBZXele+CYdaooaqZpUrtbIY6T85zgQPeBxHOatYiyt+PGz9+lQgxVyeZPdKy568DTD3sJuI5S@vger.kernel.org
X-Gm-Message-State: AOJu0YynUhJmVHNDjMIlOu4gxBXPKSU5ExPVYA7uKpOPLZrGMKyPduVa
	mvjbhU3Jrrd+qEMJ/0sAnyHswyvyvnQv6IlzrP4i8iG/Ho3sn9ADsaIeXip8gHpXPfk=
X-Gm-Gg: ASbGncv62eFfRkKHUhQ/VUmIVUd2G35MuqjtYrcEM+EU8NIIyCfjnWwFM21ENpbHV7S
	s65YJd5PY7Zm9LcaMaMyik2R4J740wmAlugG5rwEIW8J+tKpufEES4Wxie2S+5CLW5oo1jq7gr2
	vgn1c0+CDo0o4sO6aRvUTH8lvGCa/0BTqzXddsoydxuKu5u9BTtXwdB58xauzw+jGsMvfr+6KdL
	2JcuaPmave0UGci6PnQ1jzB1l2OykjJtA+2YHwJ7UUXEgyHube4RwYZooYQ8IS/3MFuVcC4RbsF
	x4R67+YdWXJH30Fop/SqyKMZqR7fKQiDh9lpN7Qq2hsgS4RG+LiCA6374P4=
X-Google-Smtp-Source: AGHT+IGgfAKEnkU5dJt4CEDcabnlosi+J8OfnBK+4UySYontAor1SeZ9LKCEkVPHVVC/2Z7AtYqeog==
X-Received: by 2002:a05:6e02:3090:b0:3d9:34c8:54ce with SMTP id e9e14a558f8ab-3ddce4a9ff5mr14367375ab.18.1749161043046;
        Thu, 05 Jun 2025 15:04:03 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df5fa234sm91779173.119.2025.06.05.15.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 15:04:02 -0700 (PDT)
Message-ID: <f3129b82-e01c-4213-8582-dcc3a6bcf807@kernel.dk>
Date: Thu, 5 Jun 2025 16:04:01 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Keith Busch <kbusch@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250606075230.6a13c53d@canb.auug.org.au>
 <aEISwo8LR8hG0zyV@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aEISwo8LR8hG0zyV@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 3:57 PM, Keith Busch wrote:
> On Fri, Jun 06, 2025 at 07:52:30AM +1000, Stephen Rothwell wrote:
>> Commit
>>
>>   10f4a7cd724e ("nvme: fix command limits status code")
>>
>> is missing a Signed-off-by from its author.
> 
> FWIW, my Signed-off-by is in the original posting, so it must have
> accidently been chopped off somewhere on the way.
> 
>   https://lore.kernel.org/linux-nvme/20250520202037.2751433-1-kbusch@meta.com/

Either maybe some manual amend that Christoph did, or he's not using
tooling like b4 perhaps and manual labor lost it?

-- 
Jens Axboe


