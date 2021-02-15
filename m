Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3D631B7BA
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 12:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBOLD2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 06:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59269 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229779AbhBOLD2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Feb 2021 06:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613386921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tWBUts84ZakMrFm1RZc/6Za4l9KVFtjkE6h0wbdwb28=;
        b=Gs2/Bmi3xVZ4nEfNxQh7gz8GjBa2qneio8C/IpZ8keuG1s/JiRZ43Sx49Fqc04oDuS9pHu
        cIAoIptMMY7yKP3q+Xu7936oZuz9Uk0bHTgb/+Nm1P2OzNqnpAhotTJIFZ2t9GwEFA5Of9
        TVQPvqNt0GKUDvJXHrKP0MkHt00vXtc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-l4gY89tcNDiNC-OtyvNqTA-1; Mon, 15 Feb 2021 06:01:59 -0500
X-MC-Unique: l4gY89tcNDiNC-OtyvNqTA-1
Received: by mail-wr1-f72.google.com with SMTP id s18so9457782wrf.0
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 03:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tWBUts84ZakMrFm1RZc/6Za4l9KVFtjkE6h0wbdwb28=;
        b=Inh2lKUHAb9fSdgOd6xKfPL9WW+8MidNW3DCcsTWllsCqkDQouVWJ7ipJXyFWt5we+
         yTvARWfAMslarg/MhKAeyIeqehb0Cgq5rA0HR4F8AiNrLAWiJlFGki/y6cRq/UB/S/j6
         5PIC5lVlh7fQCqfCLflViI8RYCJt5VDEoCQJ4VcwJTCuXGMZ4b4ZuMKbHNlYG6Q+hcjB
         iePWnnc9MSAeH7tdou3OIQiEduSPK4bF5dHCAuTo7+Z7Yq6TykAAXXYnbSBe4y1LoCOM
         9sfLUr/kx8t6tiqOVBAs2RmxmRezsMLKvckpYHlQtVBf4RMMDmiUudbg0XST8E9DGpmU
         LQlA==
X-Gm-Message-State: AOAM533mnr9gj118sdABHJSyNgUjhABLgBg543HEEpVUhLQdfAXtaJXP
        aFXCEYtCmCQwn4ADPf49piYyWYEgSn0z9g1mC35eSHemwhG9YaK5YtgKlWvunAhFW+RUe0zLakC
        kmWt6t+LR+btFMGcXI8hF4A==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr18149950wrg.362.1613386917382;
        Mon, 15 Feb 2021 03:01:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXQq08i+/RQsXj5NKZe5iGT+5VgnUN92wMUe264vdcFESWjc/jTZFgDiK6vCqqQA2VKRGdBg==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr18149925wrg.362.1613386917119;
        Mon, 15 Feb 2021 03:01:57 -0800 (PST)
Received: from linux.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
        by smtp.gmail.com with ESMTPSA id x4sm22579304wrn.64.2021.02.15.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 03:01:56 -0800 (PST)
Date:   Mon, 15 Feb 2021 12:01:54 +0100
From:   Guillaume Nault <gnault@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Davide Caratti <dcaratti@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20210215110154.GA28453@linux.home>
References: <20210215114354.6ddc94c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215114354.6ddc94c7@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 15, 2021 at 11:43:54AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   tools/testing/selftests/net/forwarding/tc_flower.sh
> 
> between commit:
> 
>   d2126838050c ("flow_dissector: fix TTL and TOS dissection on IPv4 fragments")
> 
> from the net tree and commits:
> 
>   203ee5cd7235 ("selftests: tc: Add basic mpls_* matching support for tc-flower")
>   c09bfd9a5df9 ("selftests: tc: Add generic mpls matching support for tc-flower")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc tools/testing/selftests/net/forwarding/tc_flower.sh
> index b11d8e6b5bc1,a554838666c4..000000000000
> --- a/tools/testing/selftests/net/forwarding/tc_flower.sh
> +++ b/tools/testing/selftests/net/forwarding/tc_flower.sh
> @@@ -3,7 -3,9 +3,9 @@@
>   
>   ALL_TESTS="match_dst_mac_test match_src_mac_test match_dst_ip_test \
>   	match_src_ip_test match_ip_flags_test match_pcp_test match_vlan_test \
> - 	match_ip_tos_test match_indev_test match_ip_ttl_test"
> + 	match_ip_tos_test match_indev_test match_mpls_label_test \
> + 	match_mpls_tc_test match_mpls_bos_test match_mpls_ttl_test \
>  -	match_mpls_lse_test"
> ++	match_mpls_lse_test match_ip_ttl_test"

That's technically right. But I think it'd be nicer to have
"match_ip_ttl_test" appear between "match_ip_tos_test" and
"match_indev_test", rather than at the end of the list.

Before these commits, ALL_TESTS listed the tests in the order they were
implemented in the rest of the file. So I'd rather continue following
this implicit rule, if at all possible. Also it makes sense to keep
grouping all match_ip_*_test together.

>   NUM_NETIFS=2
>   source tc_common.sh
>   source lib.sh

