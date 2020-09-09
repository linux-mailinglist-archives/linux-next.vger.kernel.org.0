Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4233626345A
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 19:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbgIIRTe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 13:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbgIIP1Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 11:27:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBD7C06134D;
        Wed,  9 Sep 2020 06:56:59 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so3033394wrl.12;
        Wed, 09 Sep 2020 06:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BEYCNqgyVOK8LPHm0pW4gAQlXSGsL9SxMYctPkZYsHs=;
        b=DTyimvyUJkz5jsk/uhVkU2oSMDIcAlgsNGEUGmPcgAL38LkplJ71fCV1INCXFoATQ/
         x4acNttWaBovxqTj7wCmX+AcTsozmKZtgfIvmtynQQ1rTSWPO2BTcPbGbpCm+W8zB0b/
         LsUVJZTYghi3q+cSZmOgRbnQrgGwuqLt3FI1Q1148EC02AZQI8PdQTgTVUxtdLpKpjgS
         ChW+JAMIDUtN/064x10uzDfFLJykGFDXxsYtoSnuH/csnnfB+uxlWA7PPQh7FbZ+rhI7
         yffBubaG1T4R8w+dJxwZwbqRmU6IpkjMV25kW5h4Fm0PVvvAjNWXghHjhX8wOqpxA2c4
         mepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BEYCNqgyVOK8LPHm0pW4gAQlXSGsL9SxMYctPkZYsHs=;
        b=tbLTx+L/cE4vj5mleX5MnoHGIqIkxmMCdl/kQt0SIUV3vYzsOLTbwLaehcQo7VKfev
         icyPp4ysF66bIse653IL8hRybwkhflit0bi3y2LSoQmseSmi8IT+63f6+tjgXGm3zoVC
         qqZRnzbm+vhXvWSl3lscgLSAEigkyMYroQDS/HknelhohnUQunIzv0LhiQyzRN6ruGiz
         9HEwMOnpqkCbH0gD/fEZl5z2el11zmCGM9vdBUsYd0YVtr6F1byAmYdxfDYagnwsWly7
         Mqy64dGlUxbC3dqUKWCzrFZl6er4qMuFJIf2gXK/nIPnMd/oZg8e1JhCou1v68Yai/UC
         ePnQ==
X-Gm-Message-State: AOAM532ULL4hwIV4HWOUI8Pvjh4U+RtsYvGsiRoUglA7KBLwBh3qX9vl
        FdjJJZdOEieJKEbna4v2yhU562NoDZE=
X-Google-Smtp-Source: ABdhPJw1g2DznKLop0gjKRUfU3u5Dl/1ECcNw6HJ524feFznXNwBISGkn0wO6A++0KBND14/MEnGIg==
X-Received: by 2002:adf:ba83:: with SMTP id p3mr4330840wrg.246.1599659818085;
        Wed, 09 Sep 2020 06:56:58 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
        by smtp.gmail.com with ESMTPSA id q20sm3966068wmj.5.2020.09.09.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 06:56:57 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the mediatek tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Wunderlich <frank-w@public-files.de>
References: <20200909204951.5d3196d0@canb.auug.org.au>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <cefa0d86-d9ed-d2be-91db-b060aafd8b52@gmail.com>
Date:   Wed, 9 Sep 2020 15:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909204951.5d3196d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 09/09/2020 12:49, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    845d404207f1 ("arm: dts: mt7623: move display nodes to separate mt7623n.dtsi")
> 
> Fixes tag
> 
>    Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")
> 
> has these problem(s):
> 
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").
> 

Fixed now and pushed again. Thanks for noting.

Regards,
Matthias
