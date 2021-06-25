Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564AB3B46EA
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 17:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFYPvJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 11:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhFYPvI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 11:51:08 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09A1C061766
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 08:48:47 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id k5so10073960ilv.8
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 08:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mee7pCIXLz/2UHZ5I3/xTGCD0ip0TTift4QJgPfnH20=;
        b=fvDrAdqfHyjTpd2AIsPcbceJdYEfyLtCcQWDH8cAUbgsHQSgfUCvt6D9+eaZcRyrp4
         dxJO9rj095WGPCG2O+uXfG/b1YdRcJpafiez6d0cOm9o+mwSQWXfgAty4/oamCrk/iT+
         R90l4Rl4Gwhyn4GTFGSk/2x9/RQnoCbiw2HhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mee7pCIXLz/2UHZ5I3/xTGCD0ip0TTift4QJgPfnH20=;
        b=Msbh8YaS7WFVxEcPvcHisuKODFEr0r2xFVfxnlE2Esf1evYor0coqOQI2D2WLLQXPU
         op2yWyjNEb424bypLUT2qB9RJLIo2Ip68PCUIdp9YwAmDckTCfRzTJb/nEKbco1IeXsa
         d/RG53a/G/rtn+zkhgmeZ2dtLhCBVfK6LbO6/YztmyNxmFWdiiGorQqbbsA09vlwwrcT
         QFA/Bo2n/UbADAwPwBakY8cjnDvt7EfSnkUPgxtJMiJzJgJgeUN1liyRCOxbA4+Nb9sP
         pZNOj25xKnDTdbqD3Sj3Rdqn6QYNL/ExHhJrFxom1wq0YyprZMgo5EKzy0oxl8b/GEI8
         IJ2g==
X-Gm-Message-State: AOAM5303Q4TzbBWPQB29PzKbomFC5cB1B+iwnpQPiNj7sXaZZ79eRPPa
        MdkLWLjJaFGzMeyf5E588s7LAw==
X-Google-Smtp-Source: ABdhPJwemTsJCqS93tSwRCgkrVP3t4kecLaIfwF31MEuko7Y/Gf7ItgTi8G5S8vmmx4dvPern3O6gg==
X-Received: by 2002:a92:1942:: with SMTP id e2mr8286758ilm.4.1624636127377;
        Fri, 25 Jun 2021 08:48:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q7sm3367802iob.49.2021.06.25.08.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:48:46 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the kunit-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210625200520.7e44f38e@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <305e3cdc-3ffe-91d3-1034-4b7395e301d9@linuxfoundation.org>
Date:   Fri, 25 Jun 2021 09:48:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625200520.7e44f38e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/25/21 4:05 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kunit-fixes tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/thunderbolt/test.c:9:
> drivers/thunderbolt/test.c: In function 'tb_test_path_single_hop_walk':
> drivers/thunderbolt/test.c:455:25: error: 'typeof' applied to a bit-field
>    455 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:455:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    455 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:466:25: error: 'typeof' applied to a bit-field
>    466 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:466:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    466 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_daisy_chain_walk':
> drivers/thunderbolt/test.c:512:25: error: 'typeof' applied to a bit-field
>    512 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:512:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    512 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:523:25: error: 'typeof' applied to a bit-field
>    523 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:523:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    523 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_simple_tree_walk':
> drivers/thunderbolt/test.c:573:25: error: 'typeof' applied to a bit-field
>    573 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:573:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    573 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:584:25: error: 'typeof' applied to a bit-field
>    584 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:584:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    584 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_complex_tree_walk':
> drivers/thunderbolt/test.c:655:25: error: 'typeof' applied to a bit-field
>    655 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:655:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    655 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:666:25: error: 'typeof' applied to a bit-field
>    666 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:666:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    666 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_max_length_walk':
> drivers/thunderbolt/test.c:756:25: error: 'typeof' applied to a bit-field
>    756 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:756:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    756 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:767:25: error: 'typeof' applied to a bit-field
>    767 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |                         ^
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:767:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    767 |   KUNIT_EXPECT_EQ(test, p->config.type, test_data[i].type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane0':
> drivers/thunderbolt/test.c:850:25: error: 'typeof' applied to a bit-field
>    850 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:850:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    850 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:853:25: error: 'typeof' applied to a bit-field
>    853 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:853:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    853 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1':
> drivers/thunderbolt/test.c:910:25: error: 'typeof' applied to a bit-field
>    910 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:910:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    910 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:913:25: error: 'typeof' applied to a bit-field
>    913 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:913:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    913 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1_chain':
> drivers/thunderbolt/test.c:988:25: error: 'typeof' applied to a bit-field
>    988 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:988:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    988 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:991:25: error: 'typeof' applied to a bit-field
>    991 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:991:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>    991 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_not_bonded_lane1_chain_reverse':
> drivers/thunderbolt/test.c:1066:25: error: 'typeof' applied to a bit-field
>   1066 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1066:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1066 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1069:25: error: 'typeof' applied to a bit-field
>   1069 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1069:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1069 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_mixed_chain':
> drivers/thunderbolt/test.c:1156:25: error: 'typeof' applied to a bit-field
>   1156 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1156:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1156 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1159:25: error: 'typeof' applied to a bit-field
>   1159 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1159:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1159 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c: In function 'tb_test_path_mixed_chain_reverse':
> drivers/thunderbolt/test.c:1246:25: error: 'typeof' applied to a bit-field
>   1246 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |                         ^~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1246:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1246 |   KUNIT_EXPECT_EQ(test, in_port->config.type, test_data[i].in_type);
>        |   ^~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1249:25: error: 'typeof' applied to a bit-field
>   1249 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |                         ^~~~~~~~
> include/kunit/test.h:804:9: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>    804 |  typeof(left) __left = (left);            \
>        |         ^~~~
> include/kunit/test.h:918:2: note: in expansion of macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
>    918 |  KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:928:2: note: in expansion of macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
>    928 |  KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1291:2: note: in expansion of macro 'KUNIT_BINARY_EQ_ASSERTION'
>   1291 |  KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/thunderbolt/test.c:1249:3: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>   1249 |   KUNIT_EXPECT_EQ(test, out_port->config.type, test_data[i].out_type);
>        |   ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    8f0877c26e4b ("thunderbolt: test: Remove some casts which are no longer required")
> 

I am applying them now. Okay to add your Aked-by Brendan?

thanks,
-- Shuah
