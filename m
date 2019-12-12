Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5F511CD4C
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 13:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbfLLMgD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 07:36:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29592 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729241AbfLLMgC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Dec 2019 07:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576154160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P7KU0yGpqd+gtXQ7PVameYcgn/rvwEa3g3YEzOaHUqM=;
        b=irhT0fJf01PpLYtwUGGjmA2OtMD29eZlM83IKK682OksDD+wNUe+/7ROQveSHsvQZwNN1k
        s4UU7yGoJGa1lfIYBDcC4h1r0VTrW+dIG8cS3+XHKOf/mY5XArZ1NrBOhYKoE/VRZmSGFi
        mqtzpKvyASuCRgQo0tYGHVUyehoHQeA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-vB9Pj4cxNbuW8nmoxtkuZg-1; Thu, 12 Dec 2019 07:35:59 -0500
X-MC-Unique: vB9Pj4cxNbuW8nmoxtkuZg-1
Received: by mail-wm1-f70.google.com with SMTP id q26so549509wmq.8
        for <linux-next@vger.kernel.org>; Thu, 12 Dec 2019 04:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P7KU0yGpqd+gtXQ7PVameYcgn/rvwEa3g3YEzOaHUqM=;
        b=XHN/DHbH+5ASMgU4FYkFpEbQwQjRB99nWen6NUzN3CC6DOHWLNhF0y8f6V7G+HEAvC
         Nx1xkJsN76eDD/PYBNaIa5OoIlzEBfeOBb18/bwFp01pCIf3JHy8QE9Bpdo/CC3wc31D
         f1tv6XiDTQkLqY+0D4OOxcHSAUvoxwnx8vGgbagY8S1vabUOk+DfY1b4u/RN1aKGZtXU
         p9lWGzBqB/mqq7dHE05VNCRIriaOXm7w3JtZbw8hGHncfDIb5OeqirwDyicbpYwFIYc+
         h6F0PR7mZipcD7Vfqe5GZw8KH6vGVvTGRuPd0BJp//76SHjlHVcCcIKPbaIxPhbS2Ifs
         Ynvg==
X-Gm-Message-State: APjAAAU1oy6ubH2yaMaCuPJMf/2oDjTzVbU+N2ZKv36rgggMkMAi/Xay
        pzbl08wKhLDlNGm0v7a47DPE6pjjfqbXDWqaRlJ+HeJKhreE9uJ3Rc/JsasOqHqkfDkL7KL4Kaa
        WKt0cyi34bBO4CTLzCbryaw==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr6522520wrr.266.1576154157709;
        Thu, 12 Dec 2019 04:35:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxxqa0QtuibXmsZ3mhtFZnBl7CO5d4j1nkjzcJUvAG+Y6HI662ZmVrAU5ebtjXiuk4TPaDHQ==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr6522495wrr.266.1576154157447;
        Thu, 12 Dec 2019 04:35:57 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id j130sm1105398wmb.18.2019.12.12.04.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 04:35:56 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drm-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>
References: <20191212225202.04d0d0e7@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2dd7955d-5477-d110-9409-1c42444ac03d@redhat.com>
Date:   Thu, 12 Dec 2019 13:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212225202.04d0d0e7@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 12-12-2019 12:52, Stephen Rothwell wrote:
> Hi all,
> 
> n commit
> 
>    64d17f25dcad ("drm/nouveau: Fix drm-core using atomic code-paths on pre-nv50 hardware")
> 
> Fixes tag
> 
>    Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1706557
> 
> has these problem(s):
> 
>    - No SHA1 recognised
> 
> I haven't seen a Fixes tag with a bug URL before, they usually reference
> the buggy commit.

Sorry my bad, that should have been a BugLink tag. The patch in question is a bugfix,
but it is sorta hard to pinpoint the cause to a specific commit, this problem was
probably introduced during the conversion of nouveau to support atomic modesetting,
which is quite a while ago and involves lots of patches.

Not sure how to best fix this since fixing would require rewriting history. I hope this
is just something we can live with?

Regards,

Hans

