Return-Path: <linux-next+bounces-499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D461D81AD15
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 04:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B302829A9
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 03:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A3DE555;
	Thu, 21 Dec 2023 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MY+qp0Bp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96456BA43
	for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2866b15b013so78313a91.0
        for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 19:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1703128296; x=1703733096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJGWqnKkED1hJpeni+YHiuU7Mhp9gSuLu448hu9J98U=;
        b=MY+qp0BpYyEyMJrBQGRiMixw43CX2HASjPWhOuySXpGiY7aefOUQPnxjrimINjwlLJ
         l3TEE7NerCPhgFgvuOvzomePvKIhNofiGvbtzMOgbq8y82Fc+x8svdFfeYbC0xjKvNir
         8Iat1ZZHgDOKIGXaQcvoztihuNqsNUvvCSj6qIA2wezaiuboOkW8z9NImeVwtBMMymZn
         0diN+ilSS5i9rCSd9laggphN373rg64Pt6w1BkcxWmo9JNFNxqepuholBXdqII113HLb
         BjaZ/IGhzWY/f4V8NoDtX0Tp8rMzUpQ9iUnZ1jaJamDmR3NjzqUbW+J2DC/oTFjx6CVG
         661Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703128296; x=1703733096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJGWqnKkED1hJpeni+YHiuU7Mhp9gSuLu448hu9J98U=;
        b=FQ4+ojxSU+9a0Ph9zqJF7axLWnf67FLufnCLMIPKKdjD65jaRyAWsRlte0tJ+NSXj0
         7QT8BX4P6cI+KDgKn28OX1+FSKeAsMQuW4bF0dtJ6Qikyfj1yqSNAh4Gx+fqCcrPAOCy
         W+lxwoap5S3SrzA/00BbA5aer7pSAOxWUWN+cvG/k4+ejkNBe9F0JAwpCmA1W5Bmmw83
         rcodyQh7iLhe3tMcXKs8UciO4+jMRLpz2RWbBDAzlNGssweLjDhb1xH56axSpd71pRE3
         IPhy8URIqc4MYIWCKCDSOMWZUoPWQ5qvcFGgtUfuC9jwVEPzQFJ5j8phzVKkyxBAoZg+
         yQ9g==
X-Gm-Message-State: AOJu0YzZ9NcYDpLHjueH25Q9SpRqw7O+uL9iLC2N6KtoCA34REyv+oeV
	lJGTHAxBAUebLfXlnTGpIrd93f8o5JF3ed/Qi2/v4Q==
X-Google-Smtp-Source: AGHT+IESh8XuIQzCEHk/nXBpum4j6GDE9hW2b/CpTgDPwLxAg0c/DRNxWgVxCaJzSFXzarydux9ovg==
X-Received: by 2002:a62:844a:0:b0:6d9:5c18:ad96 with SMTP id k71-20020a62844a000000b006d95c18ad96mr3974492pfd.0.1703128295843;
        Wed, 20 Dec 2023 19:11:35 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id u3-20020a056a00124300b006ce39a397b9sm476306pfi.48.2023.12.20.19.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 19:11:35 -0800 (PST)
Message-ID: <f31dae39-7c62-453a-8ca5-bd0b0e58769f@kernel.dk>
Date: Wed, 20 Dec 2023 20:11:34 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the block tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231221135602.12bf82f5@canb.auug.org.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231221135602.12bf82f5@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/20/23 7:56 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the vfs-brauner tree as different
> commits (but the same patches):
> 
>   24fa3ae9467f ("file: remove pointless wrapper")
>   253ca8678d30 ("Improve __fget_files_rcu() code generation (and thus __fget_light())")
>   372a34e66fb7 ("fs: replace f_rcuhead with f_task_work")
>   4e94ddfe2aab ("file: remove __receive_fd()")
>   7cb537b6f6d7 ("file: massage cleanup of files that failed to open")
>   a88c955fcfb4 ("file: s/close_fd_get_file()/file_close_fd()/g")
>   eac9189c9619 ("file: stop exposing receive_fd_user()")

Hmm confused, assumed vfs.file got rebased again, but doesn't look to be
the case. Christian?

-- 
Jens Axboe


