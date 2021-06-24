Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5843B3909
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 00:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhFXWGH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 18:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28414 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232582AbhFXWGG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Jun 2021 18:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624572226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xINwPHS+dfHZopNTm0uHfsDrjJ9951BYIaDBQCjjtec=;
        b=auOIuPrcQXdygrnnWKib6NnLx/OF3Aqwj7PkxWx7k2AWMGm9gzHdKeAjGy/UoczpwXcOdm
        Qnl97IDmnQRWimVcs8uRKjpmRGQPh4+lhrM8SRCExg9FThr7xAOxSojtOgMOLGid2jeSw1
        TpP5HbHA5ShpuxNWzaAwgnWHQpV7WIQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-_o3DmN_VO5-htV2ID1TSgQ-1; Thu, 24 Jun 2021 18:03:45 -0400
X-MC-Unique: _o3DmN_VO5-htV2ID1TSgQ-1
Received: by mail-wm1-f69.google.com with SMTP id k16-20020a7bc3100000b02901d849b41038so3395794wmj.7
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 15:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xINwPHS+dfHZopNTm0uHfsDrjJ9951BYIaDBQCjjtec=;
        b=NQbmXFGjzBwXKBmkk1YbPWUkupW3TQp4r446ng5D638x8lrTRkRGpW3qKDwKvDhpdW
         1ehVvtrVYGDyUiAHBDvbzyxDzgL83gHkBJGy5oNmCAQupMThQ3af5Qgu7tbrQ5YSjIfk
         1K+GCu9J90g/civ7O14AmkXyVVQ8wLWQbYVQIjARcG+Vs9j4FdqRpvVUSLq4N0PUZf3s
         vgqATH5YuPZ4/nQ6kk7DLzGxcWVGnQAiBpB7TWm4PKdJviuTIfCJgJ1/DzvZTrshBlH/
         5aN5LsQnOSd+dFCpXnhp/sq7MBHGcqLb0qYXpVHtILlzkb+naBE0yA6eOaYdBAKoXhb1
         JiPQ==
X-Gm-Message-State: AOAM530rPYicPTZQsymp75JRxL708s9b5c4abgDWH13Q2F15zGF5wQgr
        bRvqE4MAxWmYX08lB49CBfBSuNg4Co2qM8pk+HDR6fJRe5GG3oECo9XBeCnmYuCrUyFvq56Y/Qg
        8YPhQKxLK3XxgTQjS1nCN7/ikMm/6g3oRUDpuZRAHtc7Di7bAAcPCHs7bl5/B1YiawzTWvgujuA
        ==
X-Received: by 2002:a5d:5259:: with SMTP id k25mr3794476wrc.331.1624572223992;
        Thu, 24 Jun 2021 15:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCgqS09+IiM0mecZm6NBFzQwOQy0GTv6Ec+vOZajqOGoB1Q1LI/2+ZdB/c10FvH+UwrAQ+JQ==
X-Received: by 2002:a5d:5259:: with SMTP id k25mr3794455wrc.331.1624572223821;
        Thu, 24 Jun 2021 15:03:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x25sm10368574wmj.23.2021.06.24.15.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 15:03:43 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commits in the kvm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210625075849.3cff81da@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9409cf8b-3d56-748f-64e6-6d1e42d62413@redhat.com>
Date:   Fri, 25 Jun 2021 00:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625075849.3cff81da@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 24/06/21 23:58, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    df40a7ffa871 ("KVM: debugfs: Reuse binary stats descriptors")
>    01bb3b73038a ("KVM: selftests: Add selftest for KVM statistics data binary interface")
>    a4b86b00ad24 ("KVM: stats: Add documentation for binary statistics interface")
>    da28cb6cd042 ("KVM: stats: Support binary stats retrieval for a VCPU")
>    170a9e1294a7 ("KVM: stats: Support binary stats retrieval for a VM")
> 
> are missing a Signed-off-by from their committers.
> 

Fixed, thanks.  Still getting used to b4.

Paolo

