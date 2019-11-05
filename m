Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9900FF0026
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 15:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389531AbfKEOpE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 09:45:04 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41886 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbfKEOpE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 09:45:04 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so13834050oif.8
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 06:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VWnis//m4WNFnlxLyNlHl8kK3/QSGA3JjJ79aEU0to4=;
        b=DaoxlrH9q8f7VCHjGeu+EM52lhWRyNzsdKcNSLlVI919X2J79nOoQI7JIhlywaQa9h
         ensrTq2YlUuY5oQpH5MWwsmyNmG+r9fngp6ZLi0YkCSGvxm4wDDY6vqiNizXtM4TfuiI
         Lr12OXEqSF6yK38Ln94IdqzBCXpOXNDZlVqEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VWnis//m4WNFnlxLyNlHl8kK3/QSGA3JjJ79aEU0to4=;
        b=tpJwTkMp7qBWn3z3YDxtw2l2sApbo6NugQd4gNuMCiCyZlcCaJU3ahEJJ8t2t3qL/p
         eqEJRT3qxPesxIbpW0wgLcNjXGXfzB7MbFu56wKQTvxXBZbDhGq81B76njijIqH8yT5V
         UbYqo1e9e68/S+t7qZSxHK6BSjhNhTJW2d6ITkR3ODdtBma5u5LmgRiDq+LAxLm6HrTb
         2wdIcnZapdNcKjCevkZQ7iH2r9Q4EGHNbxEGO6WedcEywVIJtvpX6frho3oMVeL8DngS
         dFHxDtOseAVUpGP/mnpsvEmtw4sNDKj2mp51/Kzv+Op+cNDxJPBOdSABJ2wjHAAsP75F
         xe2w==
X-Gm-Message-State: APjAAAVv4UaiFkytU7y0opy1qRJtjT4Dc6Ryd0zHQE/8AdKobFMwNJU6
        JzxH2se59x0MZDPq4VWrQUTm9g==
X-Google-Smtp-Source: APXvYqwaQf3DBxvRDNzusDulEDuG9xrAmBVp2JvYuo/mCUCbGA+vq0YIswqjp7l2c7F5rwTAG08+JQ==
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr1961325oih.63.1572965103115;
        Tue, 05 Nov 2019 06:45:03 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x16sm5732293oic.40.2019.11.05.06.45.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 06:45:02 -0800 (PST)
Subject: Re: linux-next: manual merge of the akpm tree with the kunit tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20191105204526.32f19975@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4dcb9885-3094-88eb-9998-5edb87a3b4bf@linuxfoundation.org>
Date:   Tue, 5 Nov 2019 07:45:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105204526.32f19975@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/5/19 2:45 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got conflicts in:
> 
>    MAINTAINERS
>    lib/Kconfig.debug
>    lib/Makefile
>    lib/list-test.c
> 
> between commit:
> 
>    ea2dd7c0875e ("lib/list-test: add a test for the 'list' doubly linked list")
> 
> from the kunit tree and patch:
> 
>    "lib/list-test.c: add a test for the 'list' doubly linked list"
> 
> from the akpm tree.
> 
> I fixed it up (I just assume that these are different versions of the
> same patch, so I just dropped the version in the akpm tree) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 

Right. Andrew and I discussed this patch and he is in the loop that
there is a new version of this patch and that it will be combined
with the Kunit patches in kselftest tree.

Please drop the patch from akpm and carry the fix if necessary.

thanks,
-- Shuah
