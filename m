Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF893EC09D
	for <lists+linux-next@lfdr.de>; Sat, 14 Aug 2021 07:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236856AbhHNFNt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Aug 2021 01:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhHNFNt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 14 Aug 2021 01:13:49 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698A1C061575
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 22:13:21 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id bq25so12076748ejb.11
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 22:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JALH4gdR/CQtQSL/RLDHtTvz9LKofM9QnZEJnouJmDc=;
        b=uoCBGfZTQOQdQ2y3T5Ls/MpvS/jC4k8pRoy6mQBl09zCj8+a57JG0tYbews0t9HYKv
         XbNlL/ir7CKGJ5zyzVMS4KvgVEncNgLBGuzvIVU/Tbf4ktYhfCl58OfYa6RJlUW0aDki
         uGo+m49+0xqpCJpu5Wj1j9EsA6ECwxejG60yLeG+3khAuVVqCsRtrYD7j3f8s0n8bQcm
         ZaVj/fOVkEQ8lfeGWwzY6M3jFlS5UDsoF4EDvuMKOziiFApoXTP1vvXQGwDMvrnGkFAS
         uhBk0WBZ5KwetfXMocJ6E9uQVNrVc5NryxK/E2ldGqo6xtcJSeDPo1tZWLiIQLs5P7Ur
         HdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JALH4gdR/CQtQSL/RLDHtTvz9LKofM9QnZEJnouJmDc=;
        b=aRlSo0/OF3lJU7m3lMS6Y2GqPcDoNUTZw/BuTnq6pjpNQgVqtM377EpRgMzDR5nO3f
         cQERGJsk6TZDSBP93oJq/dsV0QF4VPHixu6sG3FIfvlG3TstQPyDxkraXkfOb9ylB87a
         ffkyHAkhrtb2/iF4G0lgMz4fVYBOZTwZ/p+f/IK8hf6tV34Lo5v8RLVxJyfQ6OuBsSeq
         CUAHLeW4u5XOWO87wjOePPOcOnsxHajW2Dn7J9F44NVAx//eNsFdpwSRSnmeCVTfuVoF
         g+aV/nDa+/qeCLoyi6TfeBXSMBSnU2CV8+BCVxLakMG/EZjwjyCnK8qRg877r2ZmGHYp
         Qr+w==
X-Gm-Message-State: AOAM531cptEAT1WN3X/N0QlfFkb2HjuejkcBVTUi6pWltrHc9G17aJhR
        YutpK7uTqFemgPZRswBnf19FonkOnSdtcXafDyW3Gw==
X-Google-Smtp-Source: ABdhPJzfH+akykLr5kX8n4VDZSQ8O9o1C4k3cQiTlFzXcECL4AJ8Eb2H8I/8HbJqOkdjqDD98Ll8Vo5oNo3APA4uVsQ=
X-Received: by 2002:a17:906:8606:: with SMTP id o6mr5951812ejx.247.1628917999875;
 Fri, 13 Aug 2021 22:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210810190159.4103778-1-richardsonnick@google.com> <20210810190159.4103778-3-richardsonnick@google.com>
In-Reply-To: <20210810190159.4103778-3-richardsonnick@google.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Sat, 14 Aug 2021 10:43:08 +0530
Message-ID: <CA+G9fYszRMoz-FKDJKzOuw7VkEyy-YQF1NR_0q4dc5Dpvb6ykw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pktgen: Add imix distribution bins
To:     Nicholas Richardson <richardsonnick@google.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, nrrichar@ncsu.edu,
        promanov@google.com, arunkaly@google.com,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Di Zhu <zhudi21@huawei.com>, Leesoo Ahn <dev@ooseel.net>,
        Ye Bin <yebin10@huawei.com>,
        Yejune Deng <yejune.deng@gmail.com>,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Aug 2021 at 00:32, Nicholas Richardson
<richardsonnick@google.com> wrote:
>
> From: Nick Richardson <richardsonnick@google.com>
>
> In order to represent the distribution of imix packet sizes, a
> pre-computed data structure is used. It features 100 (IMIX_PRECISION)
> "bins". Contiguous ranges of these bins represent the respective
> packet size of each imix entry. This is done to avoid the overhead of
> selecting the correct imix packet size based on the corresponding weights.
>
> Example:
> imix_weights 40,7 576,4 1500,1
> total_weight = 7 + 4 + 1 = 12
>
> pkt_size 40 occurs 7/total_weight = 58% of the time
> pkt_size 576 occurs 4/total_weight = 33% of the time
> pkt_size 1500 occurs 1/total_weight = 9% of the time
>
> We generate a random number between 0-100 and select the corresponding
> packet size based on the specified weights.
> Eg. random number = 358723895 % 100 = 65
> Selects the packet size corresponding to index:65 in the pre-computed
> imix_distribution array.
> An example of the  pre-computed array is below:
>
> The imix_distribution will look like the following:
> 0        ->  0 (index of imix_entry.size == 40)
> 1        ->  0 (index of imix_entry.size == 40)
> 2        ->  0 (index of imix_entry.size == 40)
> [...]    ->  0 (index of imix_entry.size == 40)
> 57       ->  0 (index of imix_entry.size == 40)
> 58       ->  1 (index of imix_entry.size == 576)
> [...]    ->  1 (index of imix_entry.size == 576)
> 90       ->  1 (index of imix_entry.size == 576)
> 91       ->  2 (index of imix_entry.size == 1500)
> [...]    ->  2 (index of imix_entry.size == 1500)
> 99       ->  2 (index of imix_entry.size == 1500)
>
> Create and use "bin" representation of the imix distribution.
>
> Signed-off-by: Nick Richardson <richardsonnick@google.com>
> ---
>  net/core/pktgen.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
> index a7e45eaccef7..ac1de15000e2 100644
> --- a/net/core/pktgen.c
> +++ b/net/core/pktgen.c
> @@ -177,6 +177,7 @@
>  #define MPLS_STACK_BOTTOM htonl(0x00000100)
>  /* Max number of internet mix entries that can be specified in imix_weights. */
>  #define MAX_IMIX_ENTRIES 20
> +#define IMIX_PRECISION 100 /* Precision of IMIX distribution */
>
>  #define func_enter() pr_debug("entering %s\n", __func__);
>
> @@ -354,6 +355,8 @@ struct pktgen_dev {
>         /* IMIX */
>         unsigned int n_imix_entries;
>         struct imix_pkt imix_entries[MAX_IMIX_ENTRIES];
> +       /* Maps 0-IMIX_PRECISION range to imix_entry based on probability*/
> +       __u8 imix_distribution[IMIX_PRECISION];
>
>         /* MPLS */
>         unsigned int nr_labels; /* Depth of stack, 0 = no MPLS */
> @@ -483,6 +486,7 @@ static void pktgen_stop_all_threads(struct pktgen_net *pn);
>
>  static void pktgen_stop(struct pktgen_thread *t);
>  static void pktgen_clear_counters(struct pktgen_dev *pkt_dev);
> +static void fill_imix_distribution(struct pktgen_dev *pkt_dev);

Linux next 20210813 tag arm builds failed due to following build errors.

Regressions found on arm:

 - build/gcc-10-ixp4xx_defconfig
 - build/gcc-10-orion5x_defconfig
 - build/gcc-10-multi_v5_defconfig

net/core/pktgen.c:489:13: warning: 'fill_imix_distribution' used but
never defined
 static void fill_imix_distribution(struct pktgen_dev *pkt_dev);
             ^~~~~~~~~~~~~~~~~~~~~~
ERROR: modpost: "fill_imix_distribution" [net/core/pktgen.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1
make[2]: *** Deleting file 'modules-only.symvers'
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [Makefile:1918: modules] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch arm --toolchain gcc-10
--kconfig orion5x_defconfig

--
Linaro LKFT
https://lkft.linaro.org
