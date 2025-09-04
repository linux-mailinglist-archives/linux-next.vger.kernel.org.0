Return-Path: <linux-next+bounces-8183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF2B43040
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 05:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4CA1BC292E
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 03:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F131227BF7E;
	Thu,  4 Sep 2025 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns5yi8Zu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682DC8CE;
	Thu,  4 Sep 2025 03:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756955553; cv=none; b=caHgCGBfK5NgUaUeE6xqOcfXb4VXEHEQbq5b7IWOpUtBf3GpBejw0JHkMJMfOjs96bD4VHfGLhQYytuW61j3E/hYGlvM4pav6j6P23yTN/fyz+q2eE/EZoTYlpQ5JV99yy867KjtJVh2nsCSE6vU2dxki1yBjlWwoBEhvY5Jgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756955553; c=relaxed/simple;
	bh=jGgwHHkyciIAnN9aCcWkyceCdlbYHz44cZeJMUAWl7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk6MAXMFkQr5ds9pbLDXXVgv6fmYN9ASOJCowXArFnQme0622CYI6DKNOft4Ua2BNNTGq45e7AC8/pCz4sXcbzkRT5V6B5jR/4vg22juN2PLVZ7woDEUVz9k8AoRBiIdNiT9Az4H06yCa3piElKiXrwGGftxcraGxMeF9G3Zok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns5yi8Zu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b109c6b9fcso4662431cf.3;
        Wed, 03 Sep 2025 20:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756955551; x=1757560351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tc8gN13a2HWokuUbzk+OwZcnhdlDx0Y0nnQg9W2Kp/g=;
        b=ns5yi8ZuhmimXIRJrbWQORC597lwR5HBEYdWD1/1hVmEcIdrgIPdUT0KPbojgZnqZ8
         flmxGL7A5HOqUkxhJYIQCDzg35WGxMcbAOPORj394klH+5AQlPiw5/at5wQmYR/jQfuf
         2wPBquFLR+gFjqqCDWUgEZBJ351liEMY74mrPfGlWqFQGUJ+kN3+DuzPy+8uoF7XMbv+
         SPi2EFSk9GOXC649hehrsY/a4z4uCf61UCmH3zRsFXnIbdcUQLXcOavVblP11tHR+glg
         ha8gunAe/mXKvQk4905DyFb+flYdLTu4R3VcgLyO9PiCre7YcJ1+BBa/4HDyl6RvgmhV
         iRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756955551; x=1757560351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc8gN13a2HWokuUbzk+OwZcnhdlDx0Y0nnQg9W2Kp/g=;
        b=ZUczsLqByC3IQdIW6h8u2NePHeOYoOZhlg38Ubc042RUZdTd2tjYEzXnss9HXsKlif
         jALvBoT7dweQA3KsjYhN8byoJKeB4tG97dRc4CT8BFgU0Sx561TnpE0VNb9U/eurk3/p
         iQqfV2oDYmnPzVXVqOcuSbAzVeceVIFyEkAXrmrt/iFNWnEP0nEkOhxIg0tbVV2PTQwI
         BKznmI+fR81bvMAfpRC+9PJxKKDXkLS+C3TkUcw9X0nFWFk8h1CCThVJgyRXh+aQLjGO
         bZodMGXAXlNq0VUicDO9gEt7GVmQoON22sHQxKEWIrjxp/CcuJTgyls7I48v7ghSBmRv
         c8jg==
X-Forwarded-Encrypted: i=1; AJvYcCUqvsNU2EJ3XVXsTVfFzbWYwULuum6iapVSzuskhAp7pTtKntxI+is1E70M93uQFSUM2R/3822U+hJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPJnY/lhTVguUYYvhUNeuZNw1ADpO03lkpVdU+I9FWzGYNVDc
	ymzKbgWBb68sCw/rA18ucNnULyyPduDRAmBNFcoNv8oBwgpm48cIxFSI+e2AtmSs9K4=
X-Gm-Gg: ASbGncvc7ittX9kHFlGXILnuPjS1M75k/8f/zZEq4jiDXFidC2NMZPyaiUN4Vo6VrDJ
	o9zdfpca79xDognK1s4H+BdaHdxqod2xD1g9rdcAwU2u+PrjdOCeWOhbjNwB7Tkop7QhxfSpaeL
	rZmYeA8HL3/T2XfOJD/akyb4So8295KmpuJVXMmyc21T0Ym6cRA01lptyEC6df85cLTjjMYqzdp
	rVmn0N7nuj41j6+KwpFk4QBat1HpRA9KtuWte1Zl+u/QtSVn5WRS+GTUjJx50NdKLABaTirXV4/
	1k3AWY/EbXsG7rzd0HtqyOxyfFoxFsvCdq4WCPVUMEqSwsdNJFK7zWIx/thrxbJrmOk3gCYJcIo
	T+PUXHzGOBHdrZsp7awqsIZHpQkdtUYtR1CCcxGxZLi8Qft9UwXwRCpXSxazUmI1a
X-Google-Smtp-Source: AGHT+IErxFCZn04nHqIN8UNaXRqbuvHl01+mRqx0BXTyhIblBJhMLxWUb77ot7NZw4qJoCoKF1eEUg==
X-Received: by 2002:ac8:588d:0:b0:4b4:9773:5868 with SMTP id d75a77b69052e-4b49782a0a0mr42154971cf.52.1756955551330;
        Wed, 03 Sep 2025 20:12:31 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f77d6c4sm21937931cf.36.2025.09.03.20.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 20:12:30 -0700 (PDT)
Message-ID: <8ed19b8a-a210-4793-80ab-57f803728d8f@gmail.com>
Date: Wed, 3 Sep 2025 20:12:28 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the broadcom tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250904075520.41151515@canb.auug.org.au>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250904075520.41151515@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/3/2025 2:55 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    2f8428700036 ("clk: rp1: convert from round_rate() to determine_rate()")
> 
> is missing a Signed-off-by from its committer.
> 

Now fixed, thanks Stephen!
-- 
Florian


